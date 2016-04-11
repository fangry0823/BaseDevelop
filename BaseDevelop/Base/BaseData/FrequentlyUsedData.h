//
//  FrequentlyUsedData.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#ifndef FrequentlyUsedData_h
#define FrequentlyUsedData_h

/**
 *  存放方便使用的数据
 */


#pragma mark -
#pragma mark 尺寸相关的
#define kScreenScale                (screenScale())
#define kScreenSize                 (screenSize())
#define kScreenWidth                (screenSize().width)
#define kScreenHeight               (screenSize().height)



#pragma mark -
#pragma mark 颜色相关
#define kMainBackGroundColor        mainBackGroundColor()   ///<主背景色
#define kMainColor                  mainColor()             ///<主色调
#define kRandomColor                UIColorFromRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))///<随机色



#pragma mark -
#pragma mark 判断机型和系统
#define kiPhone4                    iPhone4()
#define kSystemVersion              systemVersion()
#define kiOS6Later                  (kSystemVersion >= 6)
#define kiOS7Later                  (kSystemVersion >= 7)
#define kiOS8Later                  (kSystemVersion >= 8)
#define kiOS9Later                  (kSystemVersion >= 9)



#pragma mark -
#pragma mark 一些key值



#pragma mark 1.1.1 缓存
static NSString * const kUserInfo               = @"kUserInfo"; ///< 用户信息的缓存
static NSString * const kQiniuTokenDicKey       = @"QiniuTokenDicKey";///< 七牛上传的Key的本地存储的字典的key

#pragma mark 提示信息




static inline UIColor *mainBackGroundColor() {
    static UIColor *mainBackGroundColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainBackGroundColor = UIColorFromHex(0xf0eff3);
    });
    return mainBackGroundColor;
}

static inline UIColor *mainColor() {
    static UIColor *mainColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainColor = UIColorFromHex(0xf14e60);
    });
    return mainColor;
}

static inline BOOL iPhone4() {
    static BOOL iPhone4;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        iPhone4 = (kScreenHeight == 480.0f);
    });
    return iPhone4;
}

static inline double systemVersion() {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}


#endif

