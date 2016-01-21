//
//  AppDefaultSet.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import "AppDefaultSet.h"
#import "NetConnect.h"

@implementation AppDefaultSet

+ (void)appDefaultSetWithAppliction:(UIApplication *)appliaction andWithOptions:(NSDictionary *)launchOptions {
    [[NetConnect shared] ReachabilityMonitor];
}
@end
