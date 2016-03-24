//
//  UIScrollView+Slide.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/3.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "UIScrollView+Slide.h"

@implementation UIScrollView (Slide)

- (void)sildeScrollViewControlTabBarTarget:(UIViewController *)viewController {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIPanGestureRecognizer *panGestureRecognizer = self.panGestureRecognizer;
        if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
            static CGFloat translation;
            static CGFloat oldTranslation;
            static CGFloat direction;
            static BOOL showFirst;
            static BOOL showSecond;
            static BOOL show;
            static BOOL hideFirst;
            static BOOL hideSecond;
            static BOOL hide;
            
            translation = [panGestureRecognizer translationInView:self].y;
            direction = translation - oldTranslation;
            oldTranslation = translation;
            //oldTranslation 存储的数据有可能是上一次滑动留下来的数据，如果是上一次滑动留下来的数据有可能直接比新的数据大，所以做一次判断，如果连续两次一致 就显示
            showFirst = (direction > 0 && viewController.navigationController.navigationBar.top == -44);
            show = showFirst && showSecond;
            showSecond = showFirst;
            hideFirst = (direction < 0 && viewController.navigationController.navigationBar.top == 20 && self.contentOffset.y > 0);
            hide = hideFirst && hideSecond;
            hideSecond = hideFirst;
            if (show) {//显示
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.5f animations:^{
                        viewController.tabBarController.tabBar.top = kScreenHeight - 49;
                    }];
                });
            } else if (hide){//隐藏
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.5f animations:^{
                        viewController.tabBarController.tabBar.top = kScreenHeight;
                    }];
                });
            }
            oldTranslation = translation;
        }
    });
}

- (void)sildeScrollViewControlNavigationBarTarget:(UIViewController *)viewController {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIPanGestureRecognizer *panGestureRecognizer = self.panGestureRecognizer;
        if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
            static CGFloat translation;
            static CGFloat oldTranslation;
            static CGFloat direction;
            static BOOL showFirst;
            static BOOL showSecond;
            static BOOL show;
            static BOOL hideFirst;
            static BOOL hideSecond;
            static BOOL hide;
            
            translation = [panGestureRecognizer translationInView:self].y;
            direction = translation - oldTranslation;
            oldTranslation = translation;
            //oldTranslation 存储的数据有可能是上一次滑动留下来的数据，如果是上一次滑动留下来的数据有可能直接比新的数据大，所以做一次判断，如果连续两次一致 就显示
            showFirst = (direction > 0 && viewController.navigationController.navigationBar.top == -44);
            show = showFirst && showSecond;
            showSecond = showFirst;
            hideFirst = (direction < 0 && viewController.navigationController.navigationBar.top == 20 && self.contentOffset.y > 0);
            hide = hideFirst && hideSecond;
            hideSecond = hideFirst;
            
            if (show) {//显示
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.5f animations:^{
                        viewController.navigationController.navigationBar.top = 20;
                    }];
                });
            } else if (hide) {//隐藏
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.5f animations:^{
                        viewController.navigationController.navigationBar.top = -44;
                    }];
                });
            }
        }
    });
}


@end
