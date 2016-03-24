//
//  Request.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import "NetRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "DeviceVersion.h"
#import "ErrorAnaly.h"

static NetRequest *request = nil;

@interface NetRequest () {
    AFHTTPSessionManager *session;
}

@end

@implementation NetRequest

+ (instancetype)sharedRequest {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[self alloc] init];
    });
    return request;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURL *RequestBaseUrl = [NSURL URLWithString:kServerAddress];
        session = [[AFHTTPSessionManager alloc] initWithBaseURL:RequestBaseUrl];
        session.requestSerializer.timeoutInterval = 20.0f;
    }
    return self;
}

#pragma mark -
#pragma mark 分方法请求

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary *)parameters
    success:(void (^)(id _Nullable))success
    failure:(void (^)(NSError * _Nullable))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    URLString = [self systemParameterAddpendToURLStr:URLString];
    [session GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString *stateStr = [[ErrorAnaly shared] stateWithError:error];
        ShowMessage(stateStr);
        if (failure) failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(void (^)(id _Nullable))success
     failure:(void (^)(NSError * _Nullable))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    URLString = [self systemParameterAddpendToURLStr:URLString];
    [session POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *stateStr = [[ErrorAnaly shared] stateWithError:error];
        ShowMessage(stateStr);
        if (failure) failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (void)syncRequestWithMethod:(RequestMethod)method
                       URLStr:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      success:(void (^)(id _Nullable))success
                      failure:(void (^)(NSError * _Nullable))failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSTimeInterval timeout = 10.0f;
    NSMutableURLRequest *request = [self createSessionRequestWithMethod:method URLStr:URLString parameters:parameters failure:^(NetRequest * _Nullable request, NSError * _Nullable error) {
        if (failure) failure(error);
    }];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);//用来创建一个同步的sessionTask 请求
    NSURLSession *requestSession = [NSURLSession sharedSession];
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
            switch (HTTPResponse.statusCode) {
                case 200:{
                    NSDictionary *responseObject = nil;
                    data = data.length ? data : [NSData new];
                    responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                    if (success) success(responseObject);
                } break;
                default:{
                    ShowMessage(@"连接错误!");
                    NSLog(@"FaileRequestForm => %@", dataTask.currentRequest);
                    if (failure) failure(nil);
                }break;
            }
        } else {
            NSString *stateStr = [[ErrorAnaly shared] stateWithError:error];
            ShowMessage(stateStr);
            if (failure) failure(error);
        }
        dispatch_semaphore_signal(semaphore);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
    [dataTask resume];
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, timeout * NSEC_PER_SEC));
}

#pragma mark - 通过AFHTTPSessionManager.requestSerializer创建一个NSMutableURLRequest

- (NSMutableURLRequest *)createSessionRequestWithMethod:(RequestMethod)method
                                                 URLStr:(NSString *)URLString
                                             parameters:(NSDictionary *)parameters
                                                failure:(void (^)(NetRequest * _Nullable request, NSError * _Nullable error))failure {
    URLString = [self systemParameterAddpendToURLStr:URLString];
    NSURL *baseURL = [NSURL URLWithString:kServerAddress];
    NSURL *requestURL = [NSURL URLWithString:URLString relativeToURL:baseURL];
    NSString *methodStr = nil;
    switch (method) {
        case GET:{
            methodStr = @"GET";
        }break;
        case POST:{
            methodStr = @"POST";
        }break;
    }
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [session.requestSerializer requestWithMethod:methodStr URLString:[requestURL absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(session.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
    }
    return request;
}

#pragma mark - 在请求地址后拼接设备型号等参数

- (NSString *)systemParameterAddpendToURLStr:(NSString *)urlStr {
    NSMutableString *sysUrlStr = [urlStr mutableCopy];
    
    NSString *system        = @"iOS";
    NSString *sys_version   = [UIDevice currentDevice].systemVersion;
    NSString *model         = [DeviceVersion deviceVersion];
    NSString *version       = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    //    NSString *IDForVendor = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    //    NSLog(@"iPhoneIDForVendor => %@", IDForVendor);
    [sysUrlStr appendFormat:@"?system=%@&sys_version=%@&model=%@&version=%@", system, sys_version, model, version];
    return sysUrlStr;
}


@end
