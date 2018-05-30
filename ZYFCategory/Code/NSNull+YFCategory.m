//
//  NSNull+YFCategory.m
//  YFCategory
//
//  Created by 亚飞 on 2018/4/12.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "NSNull+YFCategory.h"

@implementation NSNull (YFCategory)

#define JsonObjects @[@"",@0,@{},@[]]

- (id)forwardingTargetForSelector:(SEL)aSelector {

    for (id jsonObj in JsonObjects) {
        if ([jsonObj respondsToSelector:aSelector]) {
            NSLog(@"NULL出现啦！这个对象应该是是_%@",[jsonObj class]);
            return jsonObj;
        }
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
