//
//  UtilsMacro.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

/**
 *  存放常用宏
 */


#pragma mark -
#pragma mark 打印输出
#ifdef DEBUG
#define NSLog(format, ...)                  do {                                                                        \
                                            fprintf(stderr, "%s => line:%d \n%s \n",                                    \
                                            [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                            __LINE__, __func__);                                                        \
                                            (NSLog)((@"\n"format), ##__VA_ARGS__);                                      \
                                            fprintf(stderr, "----------------------------------------------------\n");  \
                                            } while(0)
#else
#define NSLog(...)
#endif



#pragma mark -
#pragma mark RGB & Hex颜色
#define UIColorFromRGB(r, g, b)             [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorFromRGBA(r, g, b, A)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(A)]
#define UIColorFromHex(hexValue)            [UIColor colorWithRed:                          \
                                            ((float)((hexValue & 0xFF0000) >> 16))/255.0    \
                                            green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
                                            blue:((float)(hexValue & 0xFF))/255.0           \
                                            alpha:1.0]
#define UIColorFromHexA(hexValue, A)        [UIColor colorWithRed:                          \
                                            ((float)((hexValue & 0xFF0000) >> 16))/255.0    \
                                            green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
                                            blue:((float)(hexValue & 0xFF))/255.0           \
                                            alpha:(A)]



#pragma mark -
#pragma mark 字体字号
#define UIFontForH(flout)                   [UIFont systemFontOfSize:flout * ratio()]
#define UIFontForB(flout)                   [UIFont boldSystemFontOfSize:flout * ratio()]


#pragma mark -
#pragma mark 尺寸系数
#define WidthForRatio(flout)                (flout * ratioW())
#define HeightForRatio(flout)               (flout * ratioH())


#pragma mark -
#pragma mark 强弱对象引用的转换
#if DEBUG
    #if __has_feature(objc_arc)
        #define WeakObj(object)             autoreleasepool{} __weak __typeof__(object) object##_##weak = object;
    #else
        #define WeakObj(object)             autoreleasepool{} __block __typeof__(object) object##_##block = object;
    #endif
#else
    #if __has_feature(objc_arc)
        #define WeakObj(object)             try{} @finally{} {} __weak __typeof__(object) object##_##weak = object;
    #else
        #define WeakObj(object)             try{} @finally{} {} __block __typeof__(object) object##_##block = object;
    #endif
#endif

#if DEBUG
    #if __has_feature(objc_arc)
        #define StrongObj(object)           autoreleasepool{} __typeof__(object) object = object##_##weak;
    #else
        #define StrongObj(object)           autoreleasepool{} __typeof__(object) object = object##_##block;
    #endif
#else
    #if __has_feature(objc_arc)
        #define StrongObj(object)           try{} @finally{} __typeof__(object) object = object##_##weak;
    #else
        #define StrongObj(object)           try{} @finally{} __typeof__(object) object = object##_##block;
    #endif
#endif


#endif
