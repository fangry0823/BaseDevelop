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


CGFloat ratio() {
    static CGFloat ratio;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ratio = screenSize().width / iPhone5_W;
    });
    return ratio;
}

CGFloat ratioW() {
    return ratio();
}

CGFloat ratioH() {
    static CGFloat ratioH;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ratioH = screenSize().height / iPhone5_H;
    });
    return ratioH;
}

CGFloat navRatioW() {
    return ratio();
}

CGFloat navRatioH() {
    static CGFloat navRatioH;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navRatioH = (screenSize().height - 64.0f) / (iPhone5_H - 64.0f);
    });
    return navRatioH;
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

