//
//  AppDefaultSet.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import "AppDefaultSet.h"
#import <JPush/JPUSHService.h>
#import "VersionChange.h"
#import "SortPush.h"

static AppDefaultSet *appSet = nil;

@implementation AppDefaultSet

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appSet = [[self alloc] init];
    });
    return appSet;
}

- (void)appDefaultSetWithAppliction:(UIApplication *)application andWithOptions:(NSDictionary *)launchOptions {
    [self setNotification];
    [self setUMeng];
    [self setJPush:launchOptions];
    //fangry0823: 16.2.26  检查版本更新
    [[VersionChange shared] change];
}

- (void)setNotification {
    //程序已经进入前台
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterForeground:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

#pragma mark -
#pragma mark UMsocial
- (void)setUMeng {

}


- (BOOL)weiChatJumpComebackWithOpenURL:(NSURL *)url {
    //这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
    return YES;
}

- (void)applicationDidEnterForeground:(NSNotification *)notifiction {
    //这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
    [JPUSHService resetBadge];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}


#pragma mark -
#pragma mark JPush
- (void)setJPush:(NSDictionary *)launchOptions {
    [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                      UIUserNotificationTypeSound |
                                                      UIUserNotificationTypeAlert )
                                          categories:nil];
    [JPUSHService setupWithOption:launchOptions appKey:kJPushKey channel:kChannel apsForProduction:kIsProduction];
    [JPUSHService setLogOFF];
    //自定义消息的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    //应用通过推送进入应用的
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) {
        self.isLaunchedByNotification = YES;
    }
}

- (void)jPushRegisterDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
    [self setAliasWith:[@([UserModel shared].id) stringValue]];//设置别名
}

- (void)jPushRegisterFailWith:(NSError *)error {
    NSLog(@"极光注册失败error=>%@", error);
}

- (void)setAliasWith:(NSString *)alias {
    [JPUSHService setTags:nil alias:alias fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        if (!iResCode)
            NSLog(@"极光推送别名设置成功=>别名是:%@",iAlias);
        else
            NSLog(@"极光推送别名设置失败!");
    }];
}

//自定义消息
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    [[SortPush shared] sortMessageUserInfo:userInfo];
}

//推送消息
- (void)jPushApplication:(UIApplication *)application ReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    // 对推送来的消息进行分类处理
    [[SortPush shared] sortPushMessage:application userInfo:userInfo isLaunchedByNotification:self.isLaunchedByNotification];;
}


@end
