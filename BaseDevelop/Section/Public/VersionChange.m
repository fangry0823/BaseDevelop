//
//  VersionChange.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/26.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "VersionChange.h"
#import <CustomIOSAlertView/CustomIOSAlertView.h>

static VersionChange *change = nil;

@interface VersionChange ()<CustomIOSAlertViewDelegate>

@end

@implementation VersionChange {
    NSString *_urlStr;
}

+ (VersionChange *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        change = [[VersionChange alloc] init];
    });
    return change;
}

- (void)change {
    [[NetRequest sharedRequest] GET:kAPICheckUpdate parameters:nil success:^(id  _Nullable responseObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self checkUpdataWithDic:responseObject];
        });
    } failure:NULL];
}

- (void)checkUpdataWithDic:(NSDictionary *)dic {
    _urlStr = dic[@"link"];
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    version = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    int versionNum = [version intValue];
    NSString *dicVersionStr = [dic[@"version"] stringByReplacingOccurrencesOfString:@"." withString:@""];
    int dicVersionNum = [dicVersionStr intValue];
    if (dicVersionNum > versionNum) {
        dispatch_async(dispatch_get_main_queue(), ^{
            CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
            [alertView setButtonTitles:@[@"取消", @"更新"]];
            alertView.delegate = self;
            alertView.backgroundColor = [UIColor whiteColor];//Color(250, 250, 250);
            alertView.containerView = [self createContainerViewWithDic:dic];
            [alertView show];
        });
    }
}

- (UIView *)createContainerViewWithDic:(NSDictionary *)dic {
    CGFloat contentHeight = [dic[@"content"] boundingRectWithSize:CGSizeMake(kScreenWidth - 120, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:UIFontForH(16)} context:NULL].size.height;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 80, contentHeight + 60)];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth - 80, 20)];
    title.font = [UIFont boldSystemFontOfSize:18];
    title.text = @"有新版本更新!";
    title.textAlignment = NSTextAlignmentCenter;
    [view addSubview:title];
    
    UILabel *content = [[UILabel alloc] init];
    content.size = CGSizeMake(kScreenWidth - 120, contentHeight);
    content.centerX = view.centerX;
    content.top = title.bottom + 10;
    content.font = UIFontForH(16);
    content.numberOfLines = 0;
    content.text = dic[@"content"];
    content.textColor = [UIColor blackColor];
    content.textAlignment = NSTextAlignmentLeft;
    [view addSubview:content];
    
    return view;
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:{//点击取消
            [alertView close];
        }break;
        case 1:{//点击确定
            [alertView close];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_urlStr]];
        }break;
    }
}


@end
