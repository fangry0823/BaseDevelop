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
#define NSLog(format, ...)          do {                                                                        \
                                    fprintf(stderr, "%s => line:%d \n%s \n",                                    \
                                    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                    __LINE__, __func__);                                                        \
                                    (NSLog)((@"\n"format), ##__VA_ARGS__);                                           \
                                    fprintf(stderr, "----------------------------------------------------\n");  \
                                    } while(0)
#else
#define NSLog(...)
#endif


#pragma mark -
#pragma mark RGB颜色

#define Color(r, g, b)              [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ColorA(r, g, b, a)          [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define ColorFromRGB(rgbValue)      [UIColor colorWithRed:                          \
                                    ((float)((rgbValue & 0xFF0000) >> 16))/255.0    \
                                    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                    blue:((float)(rgbValue & 0xFF))/255.0           \
                                    alpha:1.0]
#define ColorFromRGBA(rgbValue, a)  [UIColor colorWithRed:                          \
                                    ((float)((rgbValue & 0xFF0000) >> 16))/255.0    \
                                    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                    blue:((float)(rgbValue & 0xFF))/255.0           \
                                    alpha:(a)]
// 随机色
#define ColorFroRandom              Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#pragma mark -
#pragma mark 屏幕尺寸

#define kMainScreenBounds           ([UIScreen mainScreen].bounds)
#define kMainScreenWidth            ([UIScreen mainScreen].bounds.size.width)
#define kMainScreenHeight           ([UIScreen mainScreen].bounds.size.height)
//获取当前屏幕的高度,不包含状态栏,applicationFrame就是app显示的区域
#define kApplicationFrameWidth      ([UIScreen mainScreen].applicationFrame.size.width)
#define kApplicationFrameHeight     ([UIScreen mainScreen].applicationFrame.size.height)


#pragma mark -
#pragma mark 判断机型和系统

#define IS_IPHONE4                  ([UIScreen mainScreen].bounds.size.height == 480.0f)
#define IS_IOS7                     ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)


#endif
