//
//  NSString+Process.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import "NSString+Process.h"

@implementation NSString (Process)

- (BOOL)isEmpty {
    if (!self) {
        return true;
    } else {
        if (self.length == 0) {
            return true;
        }
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

- (BOOL)isValidateString {
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm_"] invertedSet];
    NSRange foundRange = [self rangeOfCharacterFromSet:disallowedCharacters];
    if (foundRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}

- (BOOL) isValidateMobile {
    //手机号以13, 17, 14, 15, 18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((1[3,4,5,7,8][0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (CGFloat)getHeightForWidth:(CGFloat)width font:(UIFont *)font {
    if (self.length == 0) {
        return 0;
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:NULL].size;
    return size.height + 2.0;//防止忽略小数
}

- (NSString *)hexString{
    NSData *myD = [self dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i=0;i<[myD length];i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x", bytes[i]&0xff];///16进制数
        if([newHexStr length] == 1)
            hexStr = [NSString stringWithFormat:@"%@0%@", hexStr, newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@", hexStr, newHexStr];
    }
    return hexStr;
}

- (NSString *)stringFromHexString {
    char *myBuffer = (char *)malloc((int)[self length] / 2 + 1);
    bzero(myBuffer, [self length] / 2 + 1);
    for (int i = 0; i < [self length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    return unicodeString;
}

+ (BOOL)isValidatePassword:(NSString *)passwrd shortLen:(NSInteger)shortInt longLen:(NSInteger)longInt {
    if (passwrd.length >= shortInt && passwrd.length <= shortInt) {
        NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:@"[^0-9A-Za-z~!@#$%^&*()_+=-]" options:0 error:nil];
        if (regex1 != nil) {
            NSTextCheckingResult *result1 = [regex1 firstMatchInString:passwrd options:0 range:NSMakeRange(0, [passwrd length])];
            if (!result1) {
                return YES;
            }
        }
    }
    return NO;
}

+ (NSString *)subTimeString:(NSString *)timeStr {
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int dateNow = (long long int)time;
    
    long ss = (long)((dateNow - (long long int)[timeStr intValue]));
    NSString *timeString = nil;
    if (ss / 60 < 1) {
        timeString = @"刚刚";
    }else if (ss / 3600 < 1) {
        timeString = [NSString stringWithFormat:@"%ld分钟前", ss / 60];
    } else if (ss / 3600 >= 1 && ss / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%ld小时前", ss / 3600];
    } else if (ss / 86400 >= 1 && ss / 2592000 < 1) {
        timeString = [NSString stringWithFormat:@"%ld天前", ss / 86400];
    } else {
        timeString = [NSString stringWithFormat:@"%ld个月前", ss / 2592000];
    }
    return timeString;
}

+ (NSString*)getDistanceLeng:(NSString*)leng {
    float lenth = [leng floatValue];
    NSString * leg;
    if (lenth >= 1000 ){
        lenth = lenth /1000;
        leg = [NSString stringWithFormat:@"%.1fkm", lenth];
    }else if(lenth <1){
        leg = [NSString stringWithFormat:@"%.1fm", lenth];
    }else{
        leg = [NSString stringWithFormat:@"%dm", [leng intValue]];
    }
    return leg;
}

@end
