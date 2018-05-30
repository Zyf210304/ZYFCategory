//
//  UIImage+YFImage.h
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YFImage)

/**
 *  切割成正方形
 */
+ (UIImage *)clipImageWithImage:(UIImage *)image;

/**
 *  切割成指定尺寸
 *  这里切割的是图片的尺寸 不要和控制器的尺寸弄混了
 */
+ (UIImage *)clipImageWithImage:(UIImage *)image
                      withFrame:(CGRect)frame;

/**
 *  将图片 平分成m行 n列的 m*n个小图片
 */
+ (NSMutableArray *)clipImageWithImage:(UIImage *)image
                           withConuntM:(int)countM
                            withCountN:(int)countN;

@end
