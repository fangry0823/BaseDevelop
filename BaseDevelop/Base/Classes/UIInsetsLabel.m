//
//  InsetsLabel.m
//  XiaoHuaJiaDao
//
//  Created by 新锐 on 15/9/28.
//  Copyright (c) 2015年 XR. All rights reserved.
//

#import "UIInsetsLabel.h"

@implementation UIInsetsLabel

@synthesize insets=_insets;

- (instancetype)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if(self){
        self.insets = insets;
    }
    return self;
}

- (instancetype)initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if(self){
        self.insets = insets;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
