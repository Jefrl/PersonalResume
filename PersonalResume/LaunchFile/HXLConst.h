//
//  HXLConst.h
//  BaiSiBuDeJie
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
UIKIT_EXTERN NSString *const hxlExperience;
UIKIT_EXTERN NSString *const hxlAssessment;

// 简历的重用标识
UIKIT_EXTERN NSString * const introReuseID;
UIKIT_EXTERN NSString * const skillReuseID;
UIKIT_EXTERN NSString * const experienceReuseID;
UIKIT_EXTERN NSString * const assessmentReuseID;

// 简历圆点图名称
UIKIT_EXTERN NSString * const currentDot;
UIKIT_EXTERN NSString * const otherDot;

// tabBar被选中的通知名字
UIKIT_EXTERN NSString * const HXLTabBarDidSelectNotification;

// 启动 APP 发的通知
UIKIT_EXTERN NSString * const LaunchingAPPNotification;

/*
typedef enum {
    HXLTopicTypeAll = 1,
    HXLTopicTypePicture = 10,
    HXLTopicTypeWord = 29,
    HXLTopicTypeVoice = 31,
    HXLTopicTypeVideo = 41
} HXLTopicType;


// 基类的容器控件上, 中的高度, 竖直, 水平方向的间隙值
UIKIT_EXTERN CGFloat const containTopView_hight;
UIKIT_EXTERN CGFloat const containDingView_hight;
UIKIT_EXTERN CGFloat const cellMargin_y;
UIKIT_EXTERN CGFloat const essenceMargin_y;
UIKIT_EXTERN CGFloat const essenceMargin_x;
// 只是为了透彻, setFrame 跟 layoutsubViews 的自娱;
UIKIT_EXTERN CGFloat const DIY;

// 用户头像 icon 的占位小图片名
UIKIT_EXTERN NSString *const placeholder;
// 用户头像 icon 的占位大图片名
UIKIT_EXTERN NSString *const bigplaceholder;
// 设置界面重用标识
UIKIT_EXTERN NSString * const settingReuseID;

// 基类(也是段子)的重用标识;
UIKIT_EXTERN NSString * const pun_reuseID;
// 评论页面的重用标识;
UIKIT_EXTERN NSString * const cmt_reuseID;
// 评论页面 section 头部重用标识
UIKIT_EXTERN NSString * const cmt_header_reuseID;
// 评论页面 section 头部的高度
UIKIT_EXTERN CGFloat const heightForHeaderInSection;
// 我的页面的重用标识
UIKIT_EXTERN NSString * const mineCell;
// 我的页面中的 section 自动滚动距离
UIKIT_EXTERN CGFloat const mineSectionSroll;
// Mine 中方格总列数
UIKIT_EXTERN NSInteger const cols;
// 推荐关注页面中 Category 的重用标识
UIKIT_EXTERN NSString *const followCategoryReuseID;
// 推荐关注页面中 user 的重用标识
UIKIT_EXTERN NSString *const followUserReuseID;
// 推荐标签页面中的重用标识
UIKIT_EXTERN NSString *const recommentTagReuseID;
// 个人详情页面 tableView 下滚的调整距离
UIKIT_EXTERN CGFloat scrollValue;




// 网络加载自定义每次加载条数
UIKIT_EXTERN NSInteger const loadCount;
// 规定展示的热评数目
UIKIT_EXTERN NSInteger const showHotCount;

*/
