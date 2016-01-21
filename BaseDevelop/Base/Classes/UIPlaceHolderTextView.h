//
//  UIPlaceHolderTextView.h
//  XiaoHuaJiaDao
//
//  Created by 新锐 on 15/10/16.
//  Copyright © 2015年 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView <UITextViewDelegate>{

    NSString *placeholder;
    UIColor *placeholderColor;
    
@private
    UILabel *placeHolderLabel;
}

@property(nonatomic, copy) NSString *placeholder;
@property(nonatomic, strong) UILabel *placeHolderLabel;
@property(nonatomic, strong) UIColor *placeholderColor;

- (void)textChanged:(NSNotification*)notification;

@end
