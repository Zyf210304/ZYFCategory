//
//  UIView+YFCategory.h
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YFCategory)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 *  添加虚线边框
 */
- (void)addDottedLineWithCornerRadius:(CGFloat)cornerRadius;


/**
 *  添加点击事件
 *
 *  @param select 事件触发时的方法
 */
- (void)addTapgestureWithTarget:(id _Nonnull)target action:(nullable SEL)select;

/**
 *  添加阴影
 */
- (void)addShadowWithShadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;

/**
 *  添加渐变色
 */
- (void)addChangeColorWithColorArray:(NSArray * _Nonnull)colorArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint radius:(NSInteger)radius;

/**
 *  改变渐变色
 */
- (void)changeWithColorArray:(NSArray * _Nonnull)colorArray;


/**
 *  给某个view截屏并生成Image
 */
- (UIImage *_Nullable)viewShot;


@end
