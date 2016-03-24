//
//  UIView+Extension.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  移除当前View的所有子视图
 */
- (void)removeSubViews;

/**
 *  获取View对应的Controller
 */
- (UIViewController *)findViewController;


@end
