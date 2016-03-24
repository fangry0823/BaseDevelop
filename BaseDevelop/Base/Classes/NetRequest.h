//
//  Request.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestMethod) {
    GET = 1001,
    POST
};

/**
 网络请求类
 响应头信息           把NSURLResponse强转成为NSHTTPURLResponse 来获取响应头的信息(AFNetworking可以这么处理)
 关于Cookie          可以通过[NSHTTPCookieStorage sharedHTTPCookieStorage]来管理,也可以通过响应头获取.
 获取                 NSArray *cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
 设置                for (NSHTTPCookie *cookie in cookies) {
 [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
 }
 可以通过归档来存储(NSKeyedUnarchiver)
 */

@interface NetRequest : NSObject

/**
 *  网络请求的单例类
 */
+ (_Nullable instancetype)sharedRequest;

/**
 *  GET请求
 *
 *  @param  URLString   请求的url地址
 *  @param  parameters  请求发送的参数
 *  @param  success     请求成功后调用的Block
 *  @param  failure     请求失败后调用的Block
 *
 *  @return nil
 */
- (void)GET:(nullable NSString *)URLString
 parameters:(nullable NSDictionary *)parameters
    success:(nullable void (^)(id _Nullable responseObject))success
    failure:(nullable void (^)(NSError * _Nullable error))failure;

/**
 *  POST请求
 *
 *  @param  URLString   请求的url地址
 *  @param  parameters  请求发送的参数
 *  @param  success     请求成功后调用的Block
 *  @param  failure     请求失败后调用的Block
 *
 *  @return nil
 */
- (void)POST:(nullable NSString *)URLString
  parameters:(nullable NSDictionary*)parameters
     success:(nullable void (^)(id _Nullable responseObject))success
     failure:(nullable void (^)(NSError * _Nullable error))failure;

/**
 *  同步请求 10秒的同步时间,超过10秒走异步方法(不支持取消请求)
 *
 *  @param  method      请求的方法
 *  @param  URLString   请求的url地址
 *  @param  parameters  请求发送的参数
 *  @param  success     请求成功后调用的Block
 *  @param  failure     请求失败后调用的Block
 *
 *  @return nil
 */
- (void)syncRequestWithMethod:(RequestMethod)method
                       URLStr:(nullable NSString *)URLString
                   parameters:(nullable NSDictionary*)parameters
                      success:(nullable void (^)( id _Nullable responseObject))success
                      failure:(nullable void (^)( NSError * _Nullable error))failure;

/**
 *  在请求地址的字符串后面拼接设备型号等参数
 *
 *  @param  urlStr   需要拼接的字符串
 *
 *  @return NSString 拼接好的字符串
 */
- (nullable NSString *)systemParameterAddpendToURLStr:(nullable NSString *)urlStr;


@end
