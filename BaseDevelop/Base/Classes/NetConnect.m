//
//  NetConnect.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/18.
//
//

#import "NetConnect.h"

static NetConnect * netConnect = nil;

static NSString * const kHostname = @"https://www.baidu.com/";
static NSString * const kNetNone = @"似乎已断开与互联网的连接!";
static NSString * const kNetProblem = @"网络状况似乎有问题";
static NSString * const kNetMobileNotGood = @"您正在使用移动网络,似乎您的网络状况不佳!";
static NSString * const kNetWiFiNotGood = @"您正在使用WiFi,似乎您的网络状况不佳!";

@interface NetConnect ()

@property (nonatomic, strong) Reachability *hostReach;

@end

@implementation NetConnect

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netConnect = [[self alloc] init];
    });
    return netConnect;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hostReach = [Reachability reachabilityWithHostName:kHostname] ;
    }
    return self;
}

- (void)ReachabilityMonitor {
    //开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    //开始监听，会启动一个run loop
    [self.hostReach startNotifier];
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    //如果没有连接到网络就弹出提醒实况
    if (status == NotReachable)  ShowMessage(kNetProblem);
}

- (NetworkStatus)networkStatuForNow {
    return [self.hostReach currentReachabilityStatus];
}

- (NSString *)checkNetConnect {
    NetworkStatus status = [self.hostReach currentReachabilityStatus];
    NSLog(@"NetworkStatus = %lu", (long)status);
    switch (status) {
        case NotReachable:{//没有网络连接
            return kNetNone;
        }break;
        case ReachableViaWWAN:{//手机net或wap连接状态
            return kNetMobileNotGood;
        }break;
        case ReachableViaWiFi:{//Wifi连接状态
            return kNetWiFiNotGood;
        }break;
    }
}

@end
