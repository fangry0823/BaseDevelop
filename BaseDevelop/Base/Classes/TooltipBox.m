//
//  TooltipBox.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/14.
//
//

#import "TooltipBox.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation TooltipBox

//类自动调用的方法,只调用一次
+ (void)load {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithWhite:0.098f alpha:0.8f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
}

void ShowMessage(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showInfoWithStatus:statues];
        });
    }else{
        [SVProgressHUD showInfoWithStatus:statues];
    }
}

void ShowSuccessStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:statues];
        });
    }else{
        [SVProgressHUD showSuccessWithStatus:statues];
    }
}

void ShowErrorStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:statues];
        });
    }else{
        [SVProgressHUD showErrorWithStatus:statues];
    }
}

void ShowLoadingStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showWithStatus:statues];
        });
    }else{
        [SVProgressHUD showWithStatus:statues];
    }
}

void ShowProgress(CGFloat progress){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showProgress:progress];
        });
    }else{
        [SVProgressHUD showProgress:progress];
    }
}

void ShowProgressStatus(CGFloat progress, NSString *statues) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showProgress:progress status:statues];
        });
    }else{
        [SVProgressHUD showProgress:progress status:statues];
    }
}

void DismissHud(void){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }else{
        [SVProgressHUD dismiss];
    }
}


@end
