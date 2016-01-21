//
//  NetConnect.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/18.
//
//

#import <Foundation/Foundation.h>
#import <Reachability/Reachability.h>

@interface NetConnect : NSObject

/**
 *  单例类
 */
+ (instancetype)shared;

/**
 *  监测实时网络状况
 */
- (void)ReachabilityMonitor;

/**
 *  检查网络状态
 *
 *  return 状态字符串
 */
- (NSString *)checkNetConnect;

/**
 *  检查网络状态
 *
 *  return NetworkStatus状态码
 */
- (NetworkStatus)networkStatuForNow;

@end
