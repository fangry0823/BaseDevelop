//
//  ErrorAnaly.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/18.
//
//

#import "ErrorAnaly.h"
#import "NetConnect.h"

static ErrorAnaly * errorAnaly = nil;

@interface ErrorAnaly ()

@end

@implementation ErrorAnaly

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        errorAnaly = [[self alloc] init];
    });
    return errorAnaly;
}

- (NSString *)stateWithError:(NSError *)error {
    NSString *stateStr = [errorAnaly analyError:error];
    return stateStr;
}

- (NSString *)analyError:(NSError *)error {
    NSDictionary *userInfo = error.userInfo;
    NSInteger errorCode = error.code;
    NSLog(@"ErrorRequestURLFrom = > %@\nerror.domain => %@\nerror.code => %ld\nerror.localizedDescription => %@\nerror.userInfo => %@",userInfo[NSURLErrorFailingURLErrorKey],  error.domain, (long)error.code, error.localizedDescription, userInfo);
    
    switch (errorCode) {
        case -995:{
            NSLog(@"后台请求需要申请时间!");
        }break;
        case -996:{
            NSLog(@"后台请求被挤掉了!");
        }break;
        case -997:{
            NSLog(@"后台已经不在连接!");
        }break;
        case -999:{
            NSLog(@"请求被取消!");
        }break;
        case -1000:{
            return @"错误的地址!";
        }break;
        case -1001:{
            return [[NetConnect shared] checkNetConnect];
        }break;
        case -1002:{
            return @"服务器地址不正确!";
        }break;
        case -1003:{
            return @"找不到服务器!";//未能找到使用指定主机名的服务器
        }break;
        case -1004:{
            return @"不能连接服务器!";
        }break;
        case -1005:{
            return [[NetConnect shared] checkNetConnect];
        }break;
        case -1006:{
            return @"服务器错误!";
        }break;
        case -1007:{
            return @"HTTP重新定向!";
        }break;
        case -1008:{
            return @"无法获取资源!";
        }break;
        case -1009:{
            return [[NetConnect shared] checkNetConnect];
        }break;
        case -1010:{
            return @"连接指向不存在的位置!";
        }break;
        case -1011:{
            return [self errorFor1011:userInfo];
        }break;
        case -1012:{
            return @"Authentication被取消!";
        }break;
        case -1013:{
            return @"需要Authentication!";
        }break;
        case -1014:{
            return @"没有数据!";
        }break;
        case -1015:{
            return @"错误数据!";
        }break;
        case -1016:{
            return @"无法解析内容!";
        }break;
        case -1017:{
            return @"无法解析数据!";
        }break;
        case -1018:{
            return @"国际漫游关闭!";
        }break;
        case -1019:{
            return @"电话正在通话中!";
        }break;
        case -1020:{
            return @"非法数据!";
        }break;
        case -1021:{
            return @"请求队列结束!";
        }break;
        case -1022:{
            return @"需要https连接!";
        }break;
        case -1100:{
            return @"文件不存在!";
        }break;
        case -1101:{
            return @"文件是字典类型!";
        }break;
        case -1102:{
            return @"文件没有读取权限!";
        }break;
        case -1103:{
            return @"文件太大了!";
        }break;
#pragma mark SSL errors
        case -1200:{
            return @"不安全的连接!";
        }break;
        case -1201:{
            return @"证书错误!";
        case -1202:{
            return @"证书不被信任!";
        }break;
        case -1203:{
            return @"没有根证书!";
        }break;
        case -1204:{
            return @"证书已经不能访问!";
        }break;
        case -1205:{
            return @"访问证书被拒绝!";
        }break;
        case -1206:{
            return @"需要访问证书!";
        }break;
        case -2000:{
            return [[NetConnect shared] checkNetConnect];
        }break;
#pragma mark  Download and file I/O errors
        case -3000:{
            return @"不能创建文件!";
        }break;
        case -3001:{
            return @"不能打开文件!";
        }break;
        case -3002:{
            return @"不能关闭文件!";
        }break;
        case -3003:{
            return @"不能修改文件!";
        }break;
        case -3004:{
            return @"不能移动文件!";
        }break;
        case -3005:{
            return @"不能移动文件!";
        }break;
        case -3006:{
            return @"解码过程失败!";
        }break;
        case -3007:{
            return @"解码完成失败!";
        }break;
        case 3840:{
            return @"响应格式错误!";
        }break;
        default:{
            return [NSString stringWithFormat:@"未知错误(%lu)!", (long)errorCode];
        }break;
        }
    }
    return nil;
}

- (NSString *)errorFor1011:(NSDictionary *)errorUserInfo {
    
    NSHTTPURLResponse *response = nil;
    for (id obj in [errorUserInfo allValues]) {
        if ([[obj class] isSubclassOfClass:[NSHTTPURLResponse class]]) {
            response = (NSHTTPURLResponse *)obj;
        }
    }
    NSInteger statusCode = response.statusCode;
    switch (statusCode) {
        case 404:{
            return [self errorFor404:errorUserInfo];
        }break;
        case 500:{
            return @"服务器内部错误!";
        }break;
        case 503:{
            return @"服务器不可用!";
        }break;
        default:{
            return [NSString stringWithFormat:@"%@(%lu)!", @"服务器响应错误", statusCode];
        }break;
    }
    return nil;
}

- (NSString *)errorFor404:(NSDictionary *)errorUserInfo {
/*
    NSString *reason = nil;
    NSURL *errorURL = errorUserInfo[NSURLErrorFailingURLErrorKey];
    //没有登录被重定向指向为/accounts/login 做此判断用于区分
    if ([errorURL.path isEqualToString:@"/accounts/login"]) reason = @"您还没有登录!";
    else reason = @"没有发现(404)!";
    
    return reason;
*/
    return @"没有发现(404)!";
}

@end
