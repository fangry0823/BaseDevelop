//
//  ScreenScale.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import "ScreenScale.h"

CGFloat kScale = 1.0f;
CGFloat kScaleW = 1.0f;
CGFloat kScaleH = 1.0f;
CGFloat kNScaleW = 1.0f;
CGFloat kNScaleH = 1.0f;

//static CGFloat const iPhone4_W = 640.0 / 2;
//static CGFloat const iPhone4_H = 960.0 / 2;
static CGFloat const iPhone5_W = 320.0f;
static CGFloat const iPhone5_H = 568.0f;
//static CGFloat const iPhone6_W = 750.0 / 2;
//static CGFloat const iPhone6_H = 1334.0 / 2;
//static CGFloat const iPhone6P_W = 1080.0 / 2.88;
//static CGFloat const iPhone6P_H = 1920.0 / 2.88;

@implementation ScreenScale

+ (void)load {
    kScale = [UIScreen mainScreen].bounds.size.width / iPhone5_W;
    kScaleW = [UIScreen mainScreen].bounds.size.width / iPhone5_W;
    kScaleH = [UIScreen mainScreen].bounds.size.height / iPhone5_H;
    kNScaleW = [UIScreen mainScreen].bounds.size.width / iPhone5_W;
    kNScaleH = ([UIScreen mainScreen].bounds.size.height - 64) / (iPhone5_H - 64);
}

@end
