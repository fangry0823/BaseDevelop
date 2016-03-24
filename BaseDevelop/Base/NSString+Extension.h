//
//  NSString+Extension.h
//  BaseDevelop
//
//  Created by 新锐 on 16/3/23.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  判断字符串是否是空的 包括 空格
 *
 *  @return YES 是 NO 不是
 */
- (BOOL)isEmpty;

/**
 *  验证字符串是否合法
 *
 *  @return YES 合法 NO 不合法
 */
- (BOOL)isValidateString;

/**
 *  手机号码验证
 *
 *  @return YES 是手机号 NO 不是手机号
 */
- (BOOL)isValidateMobile;

/**
 *  返回一定宽度范围内字符串的高度
 *
 *  @param  width   文字要在多大的宽度范围内显示
 *  @param  font    文字要以什么样的字体显示
 *
 *  @return YES 是手机号 NO 不是手机号
 */
- (CGFloat)getHeightForWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  返回一定宽度范围内字符串的高度
 *
 *  @param  width   文字要在多大的宽度范围内显示
 *  @param  attributes 文字要以什么样的状态显示
 *
 *  @return
 */
- (CGFloat)heightForWidth:(CGFloat)width attributes:(NSDictionary *)attributes;

/**
 *  普通字符串转16进制字符串
 */
- (NSString *)hexString;

/**
 *  16进制字符串转普通字符串
 */
- (NSString *)stringFromHexString;

/**
 *  判断是不是合格密码
 *
 *  @param passwrd  密码
 *  @param shortInt 最短长度
 *  @param longInt  最长长度
 *
 *  @return YES 是 NO 不是
 */
+ (BOOL)isValidatePassword:(NSString *)passwrd shortLen:(NSInteger)shortInt longLen:(NSInteger)longInt;

/**
 * @param 时间戳字符串
 *
 * @return 传入的时间戳与现在的时间差
 */
+ (NSString *)subTimeString:(NSString *)timeStr;

/**
 *  得到合适的长度单位（比如计算距离）
 *
 *  @param leng 需要转换的m数
 *
 *  @return 得到的最终带单位的字符串
 */
+ (NSString*)getDistanceLeng:(NSString*)leng;


@end
