//
//  UIViewController+YFCategory.m
//  YFCategory
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "UIViewController+YFCategory.h"

#define ZOOM_SCALE  (float)([[UIScreen mainScreen] bounds].size.width / 350.0)


@implementation UIViewController (YFCategory)

- (CGFloat)navHeight {
    static float navHeight = 0;
    if (navHeight == 0) {
        // 状态栏(statusbar)
        CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];

        // 导航栏（navigationbar）
        CGRect rectNav = self.navigationController.navigationBar.frame;
        navHeight = rectStatus.size.height + rectNav.size.height;
    }

    return navHeight;
}



/**
 *  设置背景色
 */
- (void)setBackgroundColor:(UIColor *)color {
    self.view.backgroundColor = color;
}

/**
 *  设置返回按钮
 */
- (void)setLeftBarButtonItem {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_fanhui"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStylePlain) target:self action:@selector(popEvent)];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

/**
 *  设置返回按钮
 */
- (void)setLeftBarButtonItemWithTitle:(NSString *_Nullable)title {
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(0, 0, 60, 44);
    [right addTarget:self action:@selector(popEvent) forControlEvents:UIControlEventTouchUpInside];
    [right setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    right.titleLabel.font = [UIFont systemFontOfSize:15];
    [right setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *rightBut = [[UIBarButtonItem alloc] initWithCustomView:right];
    self.navigationItem.leftBarButtonItem = rightBut;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

/**
 *  pop ViewController
 */
- (void)popEvent {
    [self.navigationController popViewControllerAnimated:true];
}

/**
 *  设置返回按钮
 */
- (void)setRightBarButtonItemWithImage:(NSString *_Nullable)imageString action:(nullable SEL)action {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageString] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStylePlain) target:self action:action];
}

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithTitle:(NSString *_Nullable)title action:(nullable SEL)action {
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(0, 0, 60, 44);
    [right addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [right setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    right.titleLabel.font = [UIFont systemFontOfSize:15];
    [right setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *rightBut = [[UIBarButtonItem alloc] initWithCustomView:right];
    self.navigationItem.rightBarButtonItem = rightBut;
}

/**
 *  更改导航栏字体颜色
 */
- (void)setTitleWithColor:(UIColor *)color font:(UIFont *)font {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    [dict setObject:font forKey:NSFontAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

/**
 *  信息提示
 */
- (void)showToast:(NSString *)text{

    CGFloat width = 60;

    UILabel *tipLabel=nil;
    UIWindow *window = ([UIApplication sharedApplication].delegate).window;
    tipLabel=(UILabel *)[window viewWithTag:8888];
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName,nil];
    CGSize  actualsize =[text boundingRectWithSize:CGSizeMake(10000,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;

    if (!tipLabel) {
        tipLabel=[[UILabel alloc] initWithFrame:CGRectMake((window.bounds.size.width - width *ZOOM_SCALE - actualsize.width)/2, (window.bounds.size.height-64)/2-30, width + actualsize.width, actualsize.height + 20 * ZOOM_SCALE)];
        tipLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        tipLabel.alpha = 0.8;
        tipLabel.layer.cornerRadius = 10;
        tipLabel.clipsToBounds = YES;
        tipLabel.textAlignment=NSTextAlignmentCenter;
        tipLabel.textColor=[UIColor colorWithWhite:1.0 alpha:0.8];
        tipLabel.font=[UIFont boldSystemFontOfSize:14];
        tipLabel.numberOfLines=0;
        tipLabel.tag=8888;
        tipLabel.text=text;
        [window addSubview:tipLabel];
    } else {
        tipLabel.frame = CGRectMake((window.bounds.size.width - width * ZOOM_SCALE - actualsize.width)/2, (window.bounds.size.height-64)/2, width + actualsize.width, actualsize.height + 20 * ZOOM_SCALE);
        tipLabel.text=text;
    }
    [self performSelector:@selector(removeToast) withObject:nil afterDelay:1.5];
}

- (void)removeToast{
    UIWindow *window = ([UIApplication sharedApplication].delegate).window;
    UILabel *label=(UILabel *)[window viewWithTag:8888];
    [label removeFromSuperview];
}


@end
