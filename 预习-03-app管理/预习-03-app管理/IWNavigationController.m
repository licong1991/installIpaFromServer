//
//  IWNavigationController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWNavigationController.h"

@interface IWNavigationController ()

@end

@implementation IWNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文字属性
    UIFont *font = [UIFont systemFontOfSize:15.f];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName :[UIColor whiteColor]
                                     };
    
    [item setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttributes forState:UIControlStateHighlighted];
    
    NSDictionary *disabletextAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName :[UIColor lightGrayColor]
                                     };
    [item setTitleTextAttributes:disabletextAttributes forState:UIControlStateDisabled];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor whiteColor]];
    navBar.barTintColor=[UIColor colorWithRed:0.843 green:0.086 blue:0.055 alpha:0.6];
    // 设置标题属性
    
    UIFont *font = [UIFont systemFontOfSize:16.f];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName :[UIColor whiteColor]
                                     };
    
    [navBar setTitleTextAttributes:textAttributes];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
