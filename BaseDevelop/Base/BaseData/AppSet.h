//
//  AppSet.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#ifndef AppSet_h
#define AppSet_h

/**
 *  存放App的设置参数和第三方的常量key
 */


#pragma mark -
#pragma mark AppSet
//主背景色
#define kMainBackGroundColor XRColorFromRGB(0xf0eff3)



#pragma mark -
#pragma mark 第三方Key

#pragma mark UMSocial
static NSString * const kUMSocialKey            = @"55c17537e0f55a4bb7004d7c";
static NSString * const kSharedURL              = @"https://www.baidu.com/";

#pragma mark WeiChat
static NSString * const kWeiChatAppID           = @"wx69436936c826d505";
static NSString * const kWeiChatKey             = @"3e2e0694c3e243568c15c9e3b9187424";

#pragma mark QQ
static NSString * const kQQAppID                = @"1104292341";
static NSString * const kQQKey                  = @"UlWFtb0nN6ckFW8p";

#pragma mark Sina 回调网址，需要和新浪的后台(新浪的网页)设置一致
static NSString * const kSinaRedirectURL        = @"http://sns.whalecloud.com/sina2/callback";


#endif
