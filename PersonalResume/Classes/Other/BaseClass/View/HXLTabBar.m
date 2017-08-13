//
//  HXLTabBar.m
//  BaiSiBuDeJie
//
//  Created by Jefrl on 17/3/3.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "HXLTabBar.h"
#import "HXLPersonalResumeVC.h"
#import "HXLNavigationController.h"
#import "HXLPopButton.h"

@interface HXLTabBar ()
/** 简历的发布按钮 */
@property (nonatomic, weak) UIButton *releaseBtn;

@end

@implementation HXLTabBar

#pragma mark ===================== 初始化 =====================
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 创建发布按钮
        UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [releaseBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [releaseBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [releaseBtn addTarget:self action:@selector(releaseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:releaseBtn];
        self.releaseBtn = releaseBtn;
        
        // 注册观察者
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(releaseBtnClick:) name:LaunchingAPPNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 获取 tabBar 按钮的总个数
    NSInteger btnCount = 0;
    for (UIControl *controlBtn in self.subviews) {
        // 要同时包含 UIButton 跟 UITabBarButton 的类
        if ([controlBtn isKindOfClass:[UIControl class]]) {
            btnCount ++;
        }
    }
    
    // 子控件布局
    NSInteger releaseIndex = btnCount / 2;
    NSInteger num = 0;
    CGFloat itemY = 0.0;
    CGFloat itemW = HXL_SCREEN_WIDTH / btnCount;
    CGFloat itemH = tabBarHeight;
    
    // 简历按钮放置于最前面, 防止遮挡;
    [self bringSubviewToFront:self.releaseBtn];
    self.releaseBtn.frame = CGRectMake(itemW * releaseIndex, itemY, itemW, itemH);
    
    for (UIControl *tabBarButton in self.subviews) {
        // 过虑掉已经设置好 frame 的简历按钮
        if (![tabBarButton isMemberOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        // 注册一个通知
        [tabBarButton addTarget:self action:@selector(postNotiClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat tempNum = num > (releaseIndex - 1) ? (num + 1) : num;
        tabBarButton.frame = CGRectMake(itemW * tempNum, itemY, itemW, itemH);
        
        num++;
    }
    
}

#pragma mark ===================== 响应方法区域 =====================
// 发布按钮点击
- (void)releaseBtnClick:(UIButton *)btn {
    // 获取主窗口来 modal 控制器
    HXLPersonalResumeVC *releaseVC = [[HXLPersonalResumeVC alloc] init];
    HXLNavigationController *nav = [[HXLNavigationController alloc] initWithRootViewController:releaseVC];
    
    UITabBarController *rootVC = (UITabBarController *)KEYWINDOW.rootViewController;
    [rootVC.selectedViewController presentViewController:nav animated:NO completion:^{
        nav.navigationBar.hidden = YES;
    }];
}

// tabBar 上的非自定义按钮发通知
- (void)postNotiClick:(UIButton *)btn {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:HXLTabBarDidSelectNotification object:nil userInfo:nil];
}


@end
