//
//  UILabel+YFCategory.m
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "UILabel+YFCategory.h"

@implementation UILabel (YFCategory)
/**
 *  获取label高度
 *
 *  @param width 标签宽
 *
 *  @return label高度
 */
- (CGFloat)getHeightWithWidth:(CGFloat)width {
    CGSize labelSize = [self sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    CGFloat height = ceil(labelSize.height) + 1;
    return height;
}

- (CGFloat)getWidth {
    //计算实际宽度
    CGSize size = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font, NSFontAttributeName,nil]];
    CGFloat labelW = size.width;
    return labelW;
}

- (void)setDifferentColor:(UIColor *)color with:(NSRange)rang {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSForegroundColorAttributeName value:color range:rang];
    self.attributedText = str;
}

- (void)setDifferentFont:(NSInteger)font with:(NSRange)rang {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:rang];
    self.attributedText = str;
}

- (void)changeStringArr:(NSArray *)changeArr andAllColor:(UIColor *)allColor andMarkColor:(UIColor *)markColor andMarkFondSize:(float)fontSize {

    NSString *tempStr = self.text;
    NSMutableAttributedString *strAtt = [[NSMutableAttributedString alloc] initWithString:tempStr];
    [strAtt addAttribute:NSForegroundColorAttributeName value:allColor range:NSMakeRange(0, [strAtt length])];
    for (NSString *change in changeArr) {
        NSRange markRange = [tempStr rangeOfString:change];
        [strAtt addAttribute:NSForegroundColorAttributeName value:markColor range:markRange];
        [strAtt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:fontSize] range:markRange];
    }

    self.attributedText = strAtt;
}
- (void)addBottomLine {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.text.length)];
    self.attributedText = str;
}

- (void)adddeleteLine {
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self.text attributes:attribtDic];
    self.attributedText = attribtStr;
}
@end
