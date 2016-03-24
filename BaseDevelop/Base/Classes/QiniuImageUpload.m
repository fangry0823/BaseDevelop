//
//  QiniuImageUpload.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/11.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "QiniuImageUpload.h"

static QiniuImageUpload *qiniuImage = nil;
void (^singleSuccessBlock)(NSString *);
void (^singleFailureBlock)();

@implementation QiniuImageUpload

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        qiniuImage = [[self alloc] init];
    });
    return qiniuImage;
}


- (void)getQiniuToken:(void (^)(NSString *token))success failure:(void (^)())failure {
    [[NetRequest sharedRequest] GET:kAPIQiniuToken parameters:nil success:^(id  _Nullable responseObject) {
        NSString *token = responseObject[@"uptoken"];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:kQiniuTokenDicKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if (success) success(token);
    } failure:failure];
}

- (void)uploadImage:(UIImage *)image progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failure:(void (^)())failure {
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    if (imageData.length > 1048576) {// 1024 * 1024 = 1048576
        CGFloat sale = 1048576 / imageData.length;
        UIImage *tempImage = [UIImage imageWithData:imageData];
        imageData = UIImageJPEGRepresentation(tempImage, sale);
    }
    if (!imageData) {
        if (failure) failure();
        return;
    }
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:kQiniuTokenDicKey];
    if (!token) {//如果没有Token则去请求Token
        [self getQiniuToken:^(NSString *token) {
            [self uploadImage:image progress:progress success:success failure:failure];
        } failure:failure];
        return;
    }
    QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:nil progressHandler:progress params:nil checkCrc:NO cancellationSignal:nil];
    QNUploadManager *uploadManager = [QNUploadManager sharedInstanceWithConfiguration:nil];
    [uploadManager putData:imageData key:nil token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        
        if (info.statusCode == kQNInvalidToken) {//如果没有Token或Token错误则去请求Token， 最多请求三次;
            [self getQiniuToken:^(NSString *token) {
                static int i = 0;
                if (i++ > 3) {
                    if (failure) failure();
                    return ;
                }
                [self uploadImage:image progress:progress success:success failure:failure];
            } failure:failure];
            return ;
        } else if (info.statusCode == 200 && resp) {
            NSString *url = resp[@"key"];
            if (success) success(url);
        } else {
            if (failure) failure();
        }
    } option:opt];
}

- (void)uploadImages:(NSArray<UIImage *> *)imageArray progress:(void (^)(CGFloat))progress success:(void (^)(NSArray *))success failure:(void (^)())failure {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    __block float totalProgress = 0.0f;
    __block float partProgress = 1.0f / [imageArray count];
    __block NSUInteger currentIndex = 0;
    
    singleFailureBlock = ^() {
        if (failure) failure();
        return;
    };
    singleSuccessBlock  = ^(NSString *url) {
        [array addObject:url];
        totalProgress += partProgress;
        progress(totalProgress);
        currentIndex++;
        if ([array count] == [imageArray count]) {
            success([array copy]);
            return;
        }
 
        [self uploadImage:imageArray[currentIndex] progress:nil success:singleSuccessBlock failure:singleFailureBlock];
    };
    
    [self uploadImage:imageArray[0] progress:nil success:singleSuccessBlock failure:singleFailureBlock];
}


@end
