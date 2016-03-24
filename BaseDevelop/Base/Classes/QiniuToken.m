//
//  QiniuToken.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/3/11.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "QiniuToken.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCrypto.h>
#import <GTM_Base64.h>

@implementation QiniuToken

@synthesize scope;
@synthesize accessKey;
@synthesize secretKey;
@synthesize liveTime;

const static NSInteger defaultLiveTime  =  300;
static QiniuToken *qiniuToken = nil;


+ (id)registerWithScope:(NSString *)theScope SecretKey:(NSString*)theSecretKey Accesskey:(NSString*)theAccessKey{
    return [self registerWithScope:theScope SecretKey:theSecretKey Accesskey:theAccessKey TimeToLive:defaultLiveTime];
}

+ (id)registerWithScope:(NSString *)theScope SecretKey:(NSString*)theSecretKey Accesskey:(NSString*)theAccessKey TimeToLive:(NSInteger)theliveTime
{
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        qiniuToken = [[QiniuToken alloc] init];
        qiniuToken.scope = theScope;
        qiniuToken.secretKey = theSecretKey;
        qiniuToken.accessKey = theAccessKey;
        qiniuToken.liveTime = theliveTime;
    });
    
    return self;
}

+ (QiniuToken *)sharedQiniuToken {
    return qiniuToken;
}

- (NSString *)uploadToken {
    NSMutableDictionary *authInfo = [[NSMutableDictionary alloc]init];
    [authInfo setObject:scope forKey:@"scope"];
    [authInfo setObject:[NSNumber numberWithLong:[[NSDate date] timeIntervalSince1970]+self.liveTime] forKey:@"deadline" ];
    //    [authInfo setObject:@"" forKey:@"callbackUrl"];
    //    [authInfo setObject:@"" forKey:@"callbackBodyType"];
    //    [authInfo setObject:@"" forKey:@"customer"];
    //    [authInfo setObject:@"" forKey:@"escape"];
    //    [authInfo setObject:@"" forKey:@"asyncOps"];
    //    [authInfo setObject:@"" forKey:@"returnBody"];
    [authInfo setObject:[NSNumber numberWithInt:1] forKey:@"detectMime"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:authInfo
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *authInfoEncoded = [self urlSafeBase64Encode:jsonData];
    NSString *authDigestEncoded = [self hmac_sha1:secretKey text:authInfoEncoded];
    return [NSString stringWithFormat:@"%@:%@:%@",accessKey,authDigestEncoded,authInfoEncoded];
}


- (NSString *)hmac_sha1:(NSString *)key text:(NSString *)text{
    
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [self urlSafeBase64Encode:HMAC];
    return hash;
}

- (NSString *)urlSafeBase64Encode:(NSData *)text {
    NSString *base64 = [[NSString alloc] initWithData:[GTM_Base64 encodeData:text]
                                             encoding:NSUTF8StringEncoding];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return base64;
}

- (NSString *)encodedEntryURI:(NSString*)entry {
    
    return [self urlSafeBase64Encode:[[NSString stringWithFormat:@"motor:%@", [self encryptMD5String:entry]] dataUsingEncoding:NSUTF8StringEncoding]];
}

-(NSString*)encryptMD5String:(NSString*)string{
    const char *cStr = [string UTF8String];
    unsigned char result[32];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wconversion"
    CC_MD5(cStr, strlen(cStr), result);
#pragma clang diagnostic pop
    NSMutableString *hash =[NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
