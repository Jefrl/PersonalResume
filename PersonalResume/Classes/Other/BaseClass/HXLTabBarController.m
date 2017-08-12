//
//  HXLTabBarController.m
//  BaiSiBuDeJie
//
//  Created by Jefrl on 17/2/28.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "HXLTabBarController.h"
#import "HXLNavigationController.h"
#import "HXLMusicTVC.h"
#import "HXLPersonalResumeVC.h"
#import "HXLEssenceVC.h"
#import "PersonalResume-Swift.h"


#import "HXLTabBar.h"

#import "UIImage+HXLRenderOriginal.h"

@interface HXLTabBarController ()

@end

@implementation HXLTabBarController

#pragma mark ====================== 初始化 ======================
- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置 tabBar
    [self setupTabBar];
    // 添加所有子控制器
    [self setupAllChildVC];
    // 自定义 tabBar 条(只读属性, 用 kvc 来访问)
    [self setValue:[[HXLTabBar alloc] init] forKey:@"tabBar"];
}

#pragma mark ====================== 消息 ======================

// 设置 tabBar 字体统一风格
- (void)setupTabBar {
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    [self SetTitleTextAttributesOfSize:FONT_11 titleTextColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self SetTitleTextAttributesOfSize:FONT_11 titleTextColor:[UIColor redColor] forState:UIControlStateSelected];
}

// 选中前&后 tabBarItem 的颜色与文字设置
- (void)SetTitleTextAttributesOfSize:(UIFont *)fontSize titleTextColor:(UIColor *)titleTextColor forState:(UIControlState)controlState {
    
    NSMutableDictionary *dictM_titleText = [NSMutableDictionary dictionary];
    dictM_titleText[NSFontAttributeName] = fontSize;
    dictM_titleText[NSForegroundColorAttributeName] = titleTextColor;
    
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class] ]];
    [tabBarItem setTitleTextAttributes:dictM_titleText forState:controlState];
}

// 添加所有子控制器
- (void)setupAllChildVC {
    // 听, 简历, 笑
    QQMusicTVC *musicTVC = [[QQMusicTVC alloc] init];
    
    HXLEssenceVC *essenceVC = [[HXLEssenceVC alloc] init];
    //    HXLPersonalResumeVC *PResumeVC = [[HXLPersonalResumeVC alloc] init];
    
    //    [self addCustomChildViewController:PResumeVC image:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_me_icon"]] selectedImage:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_me_click_icon"]] title:@"我"];
    
    [self addCustomChildViewController:musicTVC image:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_essence_icon"]] selectedImage:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_essence_click_icon"]] title:@"听一会"];
    
    [self addCustomChildViewController:essenceVC image:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_new_icon"]] selectedImage:[UIImage imageRenderingModeAlwaysOriginal:[UIImage imageNamed:@"tabBar_new_click_icon"]] title:@"笑一会"];
}

// 创建导航控制器, 并成为 UITabBarC 的子控制
- (void)addCustomChildViewController:(UIViewController *)childController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    
    HXLNavigationController *childNavC = [[HXLNavigationController alloc] initWithRootViewController:childController];
    childController.title = title;
    childNavC.tabBarItem.image = image;
    childNavC.tabBarItem.selectedImage = selectedImage;
    childNavC.tabBarItem.title = title;
    
    [self addChildViewController:childNavC];
}




/** tabBar 点击 */
/** 
 UIImage *imageStayOrigin = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 */


@end
