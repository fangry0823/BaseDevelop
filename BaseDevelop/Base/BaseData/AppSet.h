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
 *  存放第三方的常量key
 */



/**
 *  存放App的设置参数和第三方的常量key
 */

#define Enterprise           //AppStore版本: AppStore    企业版本: Enterprise




#pragma mark 渠道名称

#ifdef AppStore
static NSString * const kChannel                = @"AppStore";
#else
static NSString * const kChannel                = @"fir";
#endif


#pragma mark -
#pragma mark 第三方Key

#pragma mark BugtagsKey
//static NSString * const kBugtagsKey             = @"a74702871cd8f94fad4f6320f9832a3e";

#pragma mark JPushKey
#ifdef AppStore
static NSString * const kJPushKey               = @"3dc02806188314232788f889";
#else
static NSString * const kJPushKey               = @"8e9f10f549c89d632b99317e";
#endif

#pragma mark UMSocial
//static NSString * const kUMSocialKey            = @"56a9ce2767e58e704c00007d";
//static NSString * const kSharedURL              = @"https://www.baidu.com/";

#pragma mark WeiChat
//static NSString * const kWeiChatAppID           = @"wxb563a22e0406e9a9";
//static NSString * const kWeiChatKey             = @"73184532a5b5609da7ff7d4ec691a54d";

#pragma mark QQ
//static NSString * const kQQAppID                = @"1104292341";
//static NSString * const kQQKey                  = @"UlWFtb0nN6ckFW8p";

#pragma mark Sina 回调网址，需要和新浪的后台(新浪的网页)设置一致
//static NSString * const kSinaRedirectURL        = @"http://sns.whalecloud.com/sina2/callback";


#endif
