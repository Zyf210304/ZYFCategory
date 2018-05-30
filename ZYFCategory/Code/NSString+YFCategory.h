//
//  NSString+YFCategory.h
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YFCategory)

/**
 *  用户名验证
 *
 *  @param userName 用户名
 *
 *  @return 是否符合规则
 */
+ (BOOL)isUserName:(NSString * _Nullable)userName;

/**
 *  判断是否是密码
 *
 *  @param passworld 密码
 *
 *  @return 是否符合规则 字母数字下划线的组合
 */
+ (BOOL)isPasswodld:(NSString *_Nullable)passworld;


- (BOOL)isPhoneNum;

//当前版本号
+(NSString * _Nullable)getNowVersion;

/**
 *  获取字符串开头汉字的首字母
 */
+ (NSString *_Nullable)getFirstName:(NSString *_Nullable)name;

/**
 *  字符串转MD5
 */
+ (NSString *_Nullable)getMD5String:(NSString *_Nullable)yfString;

@end
