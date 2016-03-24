//
//  NavigationController.m
//  XiaoHuaJiaDao
//
//  Created by 新锐 on 15/8/31.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController () <UIGestureRecognizerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //更新状态栏风格,这种写法,如果有navigationController一定要在NavigationController里面设置
    [self setNeedsStatusBarAppearanceUpdate];
    //启用返回手势需要添加这个手势的delegate
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.tintColor = [UIColor whiteColor];
    //设置标题的颜色, 标题的字体
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17],
                                               NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationBar.barTintColor = kMainColor;
    self.navigationBar.translucent = NO;
}

//返回状态栏的风格
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}

//重写这个方法来启用返回手势
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    DismissHud();
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_returnBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.enabled = YES;
}

//重写这个方法来判断启用和禁用返回手势
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    DismissHud();
    UIViewController *viewController = [super popViewControllerAnimated:animated];
    //iOS7返回手势的启用和禁用
    if (self.viewControllers.count > 0) {
        self.interactivePopGestureRecognizer.enabled = YES;
    } else {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return viewController;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
