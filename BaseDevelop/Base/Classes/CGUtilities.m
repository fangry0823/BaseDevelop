//
//  CGUtilities.m
//  BaseDevelop
//
//  Created by 新锐 on 16/3/23.
//
//

#import "CGUtilities.h"

//static CGFloat const iPhone4_W = 640.0 / 2;
//static CGFloat const iPhone4_H = 960.0 / 2;
static CGFloat const iPhone5_W = 320.0f;
static CGFloat const iPhone5_H = 568.0f;
//static CGFloat const iPhone6_W = 750.0 / 2;
//static CGFloat const iPhone6_H = 1334.0 / 2;
//static CGFloat const iPhone6P_W = 1080.0 / 2.88;
//static CGFloat const iPhone6P_H = 1920.0 / 2.88;


CGFloat scaling() {
    static CGFloat scaling;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scaling = screenSize().width / iPhone5_W;
    });
    return scaling;
}

CGFloat scalingW() {
    return scaling();
}

CGFloat scalingH() {
    static CGFloat scalingH;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scalingH = screenSize().height / iPhone5_H;
    });
    return scalingH;
}

CGFloat navScalingW() {
    return scaling();
}

CGFloat navScalingH() {
    static CGFloat navScalingH;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navScalingH = (screenSize().height - 64.0f) / (iPhone5_H - 64.0f);
    });
    return navScalingH;
}

CGFloat screenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

CGSize screenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

