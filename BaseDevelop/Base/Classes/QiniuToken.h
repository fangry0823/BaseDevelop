//
//  QiniuToken.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/11.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QiniuToken : NSObject

/**
 *  secretKey of cloud storage.
 */
@property (copy, nonatomic) NSString *secretKey;


/**
 *  accessKey of cloud storage.
 */
@property (copy, nonatomic) NSString *accessKey;


/**
 *  scope is a name of cloud storage.
 */
@property (copy, nonatomic) NSString *scope;


/**
 *  scope is a name of cloud storage.
 */
@property NSInteger liveTime;


+ (QiniuToken *)sharedQiniuToken;
/**
 *  uploadToken.
 */
- (NSString *)uploadToken;

/**
 *  initialize instance with scope, secret key and access key, the defaut live time is 5 minutes.
 *  @param scope scope is a name of cloud storage.
 *  @param SecretKey secretKey of cloud storage.
 *  @param Accesskey accessKey of cloud storage.
 */
+ (id)registerWithScope:(NSString *)theScope SecretKey:(NSString*)theSecretKey Accesskey:(NSString*)theAccessKey;


/**
 *  initialize instance with scope, secret key and access key.
 *  @param scope scope is a name of cloud storage.
 *  @param SecretKey secretKey of cloud storage.
 *  @param Accesskey accessKey of cloud storage.
 *  @param theliveTime the time to live of token.
 */

+ (id)registerWithScope:(NSString *)theScope SecretKey:(NSString*)theSecretKey Accesskey:(NSString*)theAccessKey TimeToLive:(NSInteger)theliveTime;

@end
