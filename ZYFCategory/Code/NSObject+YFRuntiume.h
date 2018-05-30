//
//  NSObject+YFRuntiume.h
//  YFDemo_runtime
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YFRuntiume)

#pragma mark  ----- 消息发送 -----
/**
 *实例方法
 */
+(id)msgSendToObj_invocation:(id)obj Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;
/**
 *类方法
 */
+(id)msgSendToClass_invocation:(Class)YSClass Selector:(SEL)selector Prarms:(NSArray*)params NeedReturn:(BOOL)needReturn;

#pragma mark  ----- 方法替换 -----
/**
 *替换实例方法(在+load中调用)
 */
+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector withClass:(Class)classType;

/**
 *替换类方法(在+load中调用)
 */
+ (void)swizzleClassSelector:(SEL)originalSelector withClassSelector:(SEL)swizzledSelector withClass:(Class)classType;

#pragma mark ---- class_copyIvarList ----
/**
 *获取当前类的所有实例变量
 */
+(void)getAllIvarNameWithClass:(Class)YSClass Completed:(void (^)(NSArray *ivarNameArray))completed;

#pragma mark ---- class_copyPropertyList ----
/**
 *获取当前类的所有属性
 */
+(void)getAllPropertyNameWithClass:(Class)YSClass Completed:(void (^)(NSArray *propertyNameArray))completed;

@end
