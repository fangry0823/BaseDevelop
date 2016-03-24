//
//  AppDelegate.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/11.
//
//

#import "AppDelegate.h"
#import "AppDefaultSet.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[AppDefaultSet shared] appDefaultSetWithAppliction:application andWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    return  [[AppDefaultSet shared] weiChatJumpComebackWithOpenURL:url];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[AppDefaultSet shared] jPushRegisterDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[AppDefaultSet shared] jPushRegisterFailWith:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [[AppDefaultSet shared] jPushApplication:application ReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}


@end
