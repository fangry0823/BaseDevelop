//
//  InsetsLabel.h
//  XiaoHuaJiaDao
//
//  Created by 新锐 on 15/9/28.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIInsetsLabel : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (instancetype)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets) insets;
- (instancetype)initWithInsets:(UIEdgeInsets) insets;

@end
