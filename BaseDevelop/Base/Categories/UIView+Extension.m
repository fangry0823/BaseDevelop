//
//  UIView+Extension.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark -
#pragma mark 获取View所在的ViewController

- (UIViewController *)findViewController {
    id target = self;
    while (self) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}


#pragma mark -
#pragma mark 移除View上的所有子视图
- (void)removeSubViews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}


#pragma mark -
#pragma mark View的frame设置

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return CGRectGetMinX(self.frame);
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - CGRectGetHeight(frame);
    self.frame = frame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - CGRectGetWidth(frame);
    self.frame = frame;
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

- (void)setCenterX:(CGFloat)centerX {
    CGFloat centerY = CGRectGetMidY(self.frame);
    self.center = CGPointMake(centerX, centerY);
}

- (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (void)setCenterY:(CGFloat)centerY {
    CGFloat centerX = CGRectGetMidX(self.frame);
    self.center = CGPointMake(centerX, centerY);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}


@end
