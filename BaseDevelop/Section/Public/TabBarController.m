//
//  XRTabBarController.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/1/26.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "TabBarController.h"

static TabBarController *XRTabBar = nil;

@interface TabBarController ()

@end

@implementation TabBarController

+ (instancetype)shared {
    if (!XRTabBar) {
        XRTabBar = [[self alloc] init];
    }
    return XRTabBar;
}

+ (void)dellocTabBar {
    XRTabBar = nil;
}

- (void)loadView {
    [super loadView];
    [self initialController];
}

- (void)initialController {

    //在这里调用 addChildVc:... 方法
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    CGFloat titleFontSize = 10.0f;
    CGFloat titleOffsetY = 3.0f;
    UIFont *titleFont = [UIFont boldSystemFontOfSize:titleFontSize];
    childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, - titleOffsetY);
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0xb9b9b9),
                                                 NSFontAttributeName: titleFont} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0xf14e60),
                                                 NSFontAttributeName: titleFont} forState:UIControlStateSelected];
    [self addChildViewController:childController];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title {
    //image
    NSUInteger tabBarItemNum = 2;
    CGFloat tabBarItemW = kScreenWidth / tabBarItemNum;
    CGFloat tabBarItemH = 49.0f;
    CGSize  tabBarItemSize = CGSizeMake(tabBarItemW, tabBarItemH);
    CGFloat imageOffsetY = 6.0f;
    UIImage *normalImage = [[UIImage imageWithColor:UIColorFromHex(0x926bae) size:tabBarItemSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageWithColor:UIColorFromHex(0x8760a4) size:tabBarItemSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //title
    CGFloat titleFontSize = 20.0f;
    CGFloat titleOffsetY = (tabBarItemH - titleFontSize - imageOffsetY) / 2;
    UIFont *titleFont = [UIFont systemFontOfSize:titleFontSize];

    //childController
    [childController.tabBarItem setTitle:title];
    childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, - titleOffsetY);
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0xffffff), NSFontAttributeName:titleFont} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0xffffff), NSFontAttributeName:titleFont} forState:UIControlStateSelected];
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(imageOffsetY, 0, -imageOffsetY, 0);
    [childController.tabBarItem setImage:normalImage];
    [childController.tabBarItem setSelectedImage:selectedImage];

    [self addChildViewController:childController];
}

- (void)dealloc {
    NSLog(@"TabBarController被销毁");
}

@end
