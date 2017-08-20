//
//  HXLConst.h
//  CustomClass
//
//  Created by Jefrl on 17/3/15.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import <UIKit/UIKit.h>
//=================================================================
//                       固有数据
//=================================================================
// 导航条 & UITabBar 条的高度
UIKIT_EXTERN CGFloat const navigationBarHgiht;
UIKIT_EXTERN CGFloat const tabBarHeight;
// 获取版本号的 key 值 versionKey
UIKIT_EXTERN NSString *const versionKey;

//=================================================================
//                       自定义常用数据
//=================================================================
// 公共 URL
UIKIT_EXTERN NSString * const publicUrl;
UIKIT_EXTERN CGFloat const SevenPF;
UIKIT_EXTERN CGFloat const twelvePF;
UIKIT_EXTERN CGFloat const spaceFive;
UIKIT_EXTERN CGFloat const spaceTen;
UIKIT_EXTERN CGFloat const spaceFifteen;
UIKIT_EXTERN CGFloat const spaceTwenty;
UIKIT_EXTERN CGFloat const spaceTwentyF;
UIKIT_EXTERN CGFloat const spaceThirty;
UIKIT_EXTERN CGFloat const spaceThirtyF;
UIKIT_EXTERN CGFloat const spaceForty;

typedef NS_ENUM(NSInteger, ButtonType)
{
    ButtonTypeIntroduction = 0,
    ButtonTypeSkill,
    ButtonTypeExperience,
    ButtonTypeAssessment,
    ButtonTypeContact
};

// 简历文件名
UIKIT_EXTERN NSString *const hxlIntroduction;
UIKIT_EXTERN NSString *const hxlSkill;
UIKIT_EXTERN NSString *const hxlAssessment;
UIKIT_EXTERN NSString *const hxlExperience;
UIKIT_EXTERN NSString *const MiYiSkill;
UIKIT_EXTERN NSString *const ShiMaoSkill;

// 简历的重用标识
UIKIT_EXTERN NSString * const introReuseID;
UIKIT_EXTERN NSString * const skillReuseID;
UIKIT_EXTERN NSString * const experienceReuseID;
UIKIT_EXTERN NSString * const assessmentReuseID;

// 简历圆点图名称
UIKIT_EXTERN NSString * const currentDot;
UIKIT_EXTERN NSString * const otherDot;

// 特殊 cell 的跳转标识
UIKIT_EXTERN NSString * const mainSkill;
UIKIT_EXTERN NSString * const projectLink;

// 帖子类型枚举值
typedef NS_ENUM(NSUInteger, HXLTopicType)
{
    HXLTopicTypeAll = 1,
    HXLTopicTypePicture = 10,
    HXLTopicTypeWord = 29,
    HXLTopicTypeVoice = 31,
    HXLTopicTypeVideo = 41
};

// tabBar被选中的通知名字
UIKIT_EXTERN NSString * const HXLTabBarDidSelectNotification;
// 头部标题高度
UIKIT_EXTERN CGFloat const HeadlineView_height;
// 恢复全屏侧滑的通知字符串
UIKIT_EXTERN NSString * const allowFullscreenBack;

// 基类(也是段子)的重用标识;
UIKIT_EXTERN NSString * const punReuseID;
// 我的页面的重用标识
UIKIT_EXTERN NSString * const mineReuseID;
// 设置界面重用标识
UIKIT_EXTERN NSString * const settingReuseID;
// 评论页面的重用标识;
UIKIT_EXTERN NSString * const cmtReuseID;
// 评论页面 section 头部重用标识
UIKIT_EXTERN NSString * const cmtHeaderReuseID;
// 推荐关注页面中 Category 的重用标识
UIKIT_EXTERN NSString *const followCategoryReuseID;
// 推荐关注页面中 user 的重用标识
UIKIT_EXTERN NSString *const followUserReuseID;
// 推荐标签页面中的重用标识
UIKIT_EXTERN NSString *const recommentTagReuseID;

// 网络加载自定义每次加载条数
UIKIT_EXTERN NSInteger const loadCount;
UIKIT_EXTERN CGFloat const heightForHeaderInSection;

// 评论页面 section 头部的高度
UIKIT_EXTERN CGFloat const heightForHeaderInSection;

// 基类的容器控件上, 中的高度, 竖直, 水平方向的间隙值
UIKIT_EXTERN CGFloat const containTopView_hight;
UIKIT_EXTERN CGFloat const containDingView_hight;

UIKIT_EXTERN CGFloat const Underline_height;

