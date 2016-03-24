//
//  AppDefaultSet.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import <Foundation/Foundation.h>

@interface AppDefaultSet : NSObject

@property (nonatomic) BOOL isLaunchedByNotification;

/**
 *  单例类
 */
+ (instancetype)shared;

/**
 *  App启动时的设置(从AppDelegate中抽离出来)
 */
- (void)appDefaultSetWithAppliction:(UIApplication *)appliaction andWithOptions:(NSDictionary *)launchOptions;

/**
 *  这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)weiChatJumpComebackWithOpenURL:(NSURL *)url;

/**
 *  JPush设置别名
 */
- (void)setAliasWith:(NSString *)alia;
/**
 *  注册JPush的DeviceToken
 */
- (void)jPushRegisterDeviceToken:(NSData *)deviceToken;

/**
 *  注册JPush失败
 */
- (void)jPushRegisterFailWith:(NSError *)error;

/**
 *  远程推送收到的消息
 */
- (void)jPushApplication:(UIApplication *)application ReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;


@end
