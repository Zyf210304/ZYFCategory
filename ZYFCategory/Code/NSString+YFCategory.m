//
//  NSString+YFCategory.m
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "NSString+YFCategory.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (YFCategory)

/**
 *  用户名验证
 *
 *  @param userName 用户名
 *
 *  @return 是否符合规则
 */
+ (BOOL)isUserName:(NSString *)userName
{
    NSString *phoneRegex1 = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex1];
    return  [phoneTest1 evaluateWithObject:userName];
}


/**
 *  判断是否是密码
 *
 *  @param passworld 密码
 *
 *  @return 是否符合规则 字母数字下划线的组合
 */
+ (BOOL)isPasswodld:(NSString *)passworld {
    //    /^[\w]{6,20}$/
    NSString *phoneRegex1 = @"^[A-Za-z0-9_]{6,15}$";
    NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex1];
    //    bool a =  [phoneTest1 evaluateWithObject:passworld];
    return  [phoneTest1 evaluateWithObject:passworld];
}

- (BOOL)isPhoneNum{

    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];

}

//当前版本号
+(NSString *)getNowVersion {
    NSString * str = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"当前版本v%@", str];
}

+ (NSString *)getFirstName:(NSString *)name {
    //将中文转换成拼音
    if (name == nil) {
        return @"";
    }
    NSMutableString *nameM = [[NSMutableString alloc]initWithString:name]; //将字符串转换成可变字符串
    //将可变字符串转换成带音标的拼音
    CFStringTransform((__bridge CFMutableStringRef)nameM, 0, kCFStringTransformMandarinLatin, NO);
    //将带音标的拼音转换成不带音标的拼音
    CFStringTransform((__bridge CFMutableStringRef)nameM, 0, kCFStringTransformStripDiacritics, NO);

    if (nameM.length) {
        //获取拼音首字母并且转换成大写
        return [[nameM substringToIndex:1] uppercaseString];
    }
    return @"";
}

+ (NSString *)getMD5String:(NSString *)yfString {
    //MD5加密

    //将OC的字符串变为C语言
    const char *cStr = [yfString UTF8String];
    //字符串的长度
    unsigned long cStrLenth =  strlen(cStr);
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //将C语言的字符串进行加密 参数1 要加密的字符串 参数2 要加密字符串的长度 参数3 因为MD5加密后的密文是16个16进制的字符所以我们用16位的数组接收 这里我们穿进去数组的首地址
    CC_MD5(cStr, (CC_LONG)cStrLenth, result);
    NSMutableString *recretStr = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [recretStr appendFormat:@"%02x", result[i]];
    }
    return [recretStr uppercaseString];

}

@end
