//
//  ViewController.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/11.
//
//

#import "ViewController.h"
#import "TooltipBox.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kMainBackGroundColor;
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = kMainBackGroundColor;
    [self.view addSubview:view];
    NSLog(@"%lf", kSystemVersion);
    NSLog(@"%d", kiOS9Later);
    
    
    [self checkNetWork];
}

#pragma mark - 网络连接
- (void)checkNetWork {
//    NetRequest *requset = [NetRequest sharedRequest];
//    __block NSURLSessionDataTask *sessionTask = nil;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"%@", [NSThread currentThread]);
//        ShowLoadingStatus(@"正在下载");
//        sessionTask = [requset syncRequestWithMethod:GET URLStr:kAPIReady parameters:nil success:^(NetRequest * _Nullable request, id  _Nullable responseObject) {
//            DismissHud();
//            NSLog(@"%@", responseObject);
//        } failure:nil];
//        NSLog(@"先打印还是先请求");
//    });

//    sessionTask = [requset GET:kAPIChat parameters:nil success:^(NetRequest *request, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//        ShowMessage(@"bb");
//        ShowLoadingStatus(@"ccc");
//        if (kIsProduction) {
//            ShowMessage(@"aa");
//        }
//    } failure:^(NetRequest * _Nullable request, NSError * _Nullable error) {
//        ShowMessage(@"bb");
//        ShowLoadingStatus(@"ccc");
//        if (kIsProduction) {
//            ShowMessage(@"aa");
//        }
//    }];
    //    [sessionTask cancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
