//
//  UIScrollView+Slide.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/3.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Slide)

/**
 *  通过ScrollView的滑动控制TabBar的显示与隐藏,在ScrollVeiw的scrollViewDidScroll:回调方法中使用
 *
 *  @param  viewController  谁需要触发显示和隐藏TabBar
 */
- (void)sildeScrollViewControlTabBarTarget:(nullable UIViewController *)viewController;

/**
 *  通过ScrollView的滑动控制NavigationBar的显示与隐藏,在ScrollVeiw的scrollViewDidScroll:回调方法中使用
 *
 *  @param  viewController  谁需要触发显示和隐藏TabBar
 */
- (void)sildeScrollViewControlNavigationBarTarget:(nullable UIViewController *)viewController;
@end
