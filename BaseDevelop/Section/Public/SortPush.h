//
//  PushSort.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/7.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SortPush : NSObject

+ (SortPush *)shared;

//自定义消息的处理
- (void)sortMessageUserInfo:(NSDictionary *)userInfo;
//推送的处理
- (void)sortPushMessage:(UIApplication *)application userInfo:(NSDictionary *)userInfo isLaunchedByNotification:(BOOL) byNotification;

@end
