//
//  PushSort.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/7.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "SortPush.h"

@interface SortPush ()

@end

@implementation SortPush{
    NSDictionary *_jPushUserInfo;
}

+ (SortPush *)shared {
    static SortPush *pushSort = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pushSort = [[self alloc] init];
    });
    return pushSort;
}

//极光消息
- (void)sortMessageUserInfo:(NSDictionary *)userInfo {
    _jPushUserInfo = [userInfo[@"content"] mj_JSONObject];
    NSLog(@"jPush   == %@", userInfo[@"content"]);
    [self showPoint];//显示小红点
}

//极光推送
- (void)sortPushMessage:(UIApplication *)application userInfo:(NSDictionary *)userInfo isLaunchedByNotification:(BOOL) byNotification {
    _jPushUserInfo = userInfo;
    [self showPoint];//显示小红点
    [self jumpToMessagePage:application isLanuchedByNotification:byNotification];//转跳页面
}

//显示红点
- (void)showPoint {

}

//页面的转跳
- (void)jumpToMessagePage:(UIApplication *)application isLanuchedByNotification:(BOOL) byNotification {
    switch (application.applicationState) {
        case UIApplicationStateActive:{//应用在前台
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showAlart];
                });
            });
        }break;
        case UIApplicationStateInactive:{//点击消息进入应用
            if (byNotification) {//如果是从推送启动的应用则延迟一秒执行
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    // 跳转到某个页面
                });
            } else {
                //跳转到某个页面
            }
        }break;
        default:{
        }break;
    }
}

- (void)showAlart {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:_jPushUserInfo[@"aps"][@"alert"]
                                                     message:nil
                                                    delegate:self
                                           cancelButtonTitle:@"取消"
                                           otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (!buttonIndex) return;
    //弹窗的点击
    //跳转到某个页面
}


@end
