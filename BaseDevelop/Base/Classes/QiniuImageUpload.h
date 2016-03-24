//
//  QiniuImageUpload.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/11.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QiniuSDK.h>

@interface QiniuImageUpload : NSObject

+ (instancetype)shared;
- (void)uploadImage:(UIImage *)image progress:(QNUpProgressHandler)progress success:(void (^)(NSString *url))success failure:(void (^)())failure;
- (void)uploadImages:(NSArray<UIImage *> *)imageArray progress:(void (^)(CGFloat))progress success:(void (^)(NSArray *))success failure:(void (^)())failure;

@end


