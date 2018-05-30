//
//  UILabel+YFCategory.h
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YFCategory)

/**
 *  获取label高度
 *
 *  @param width 标签宽
 *
 *  @return label高度
 */
- (CGFloat)getHeightWithWidth:(CGFloat)width;

- (CGFloat)getWidth;


#pragma mark  --- 下面两个方法只能用一个 会被覆盖  既要改尺寸又要改颜色 要自己写 ----- 
/**
 文本设置其他颜色

 @param color 要改变为的颜色
 @param rang 改变颜色的区间
 */
- (void)setDifferentColor:(UIColor *)color with:(NSRange)rang;


/**
 文本设置其他文字尺寸

 @param font 要改变为的文字尺寸
 @param rang 改变尺寸的区间
 */
- (void)setDifferentFont:(NSInteger)font with:(NSRange)rang;

/**
 改变label中已知文字的颜色

 @param changeArr 要改变颜色font的字符串数组
 @param allColor 不改变的颜色
 @param markColor 改变的颜色
 @param fontSize 改变的font
 */

- (void)changeStringArr:(NSArray *)changeArr andAllColor:(UIColor *)allColor andMarkColor:(UIColor *)markColor andMarkFondSize:(float)fontSize;
/**
 添加下划线
 */
- (void)addBottomLine;



/**
 添加删除线
 */
- (void)adddeleteLine;

@end
