//
//  ViewController.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/11.
//
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self checkNetWork];
}

#pragma mark - 网络连接
- (void)checkNetWork {
    NetRequest *requset = [NetRequest sharedRequest];
    __block NSURLSessionDataTask *sessionTask = nil;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"%@", [NSThread currentThread]);
//        ShowLoadingStatus(@"正在下载");
//        sessionTask = [requset syncRequestWithMethod:GET URLStr:kAPIReady parameters:nil success:^(NetRequest * _Nullable request, id  _Nullable responseObject) {
//            DismissHud();
//            NSLog(@"%@", responseObject);
//        } failure:nil];
//        NSLog(@"先打印还是先请求");
//    });

    sessionTask = [requset GET:kAPIShake parameters:nil success:^(NetRequest *request, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:nil];
    //    [sessionTask cancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
