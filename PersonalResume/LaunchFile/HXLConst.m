//
//  HXLConst.m
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
CGFloat const navigationBarHgiht = 20 + 44;
CGFloat const tabBarHeight = 49;
// 获取版本号的 key 值 versionKey
NSString *const versionKey = @"CFBundleShortVersionString";

//=================================================================
//                       自定义常用数据
//=================================================================
// 公共 URL
NSString * const publicUrl = @"http://api.budejie.com/api/api_open.php";
CGFloat const spaceSPF =  7.5;
CGFloat const spaceTPF = 12.5;
CGFloat const spaceFive = 5;
CGFloat const spaceTen = 10;
CGFloat const spaceFifteen = 15;
CGFloat const spaceTwenty = 20;
CGFloat const spaceTwentyF = 25;
CGFloat const spaceThirty = 30;
CGFloat const spaceThirtyF = 35;
CGFloat const spaceForty = 40;

// 简历文件名
NSString *const hxlIntroduction = @"hxlIntroduction.lrc";
NSString *const hxlSkill = @"hxlSkill.lrc";
NSString *const hxlAssessment = @"hxlAssessment.lrc";
NSString *const hxlExperience = @"Experience.plist";
NSString *const MiYiSkill = @"MiYiSkill.lrc";
NSString *const ShiMaoSkill = @"ShiMaoSkill.lrc";

// 简历的重用标识
NSString * const introReuseID = @"introReuseID";
NSString * const skillReuseID = @"skillReuseID";
NSString * const experienceReuseID = @"experienceReuseID";
NSString * const assessmentReuseID = @"assessmentReuseID";

// 特殊 cell 的跳转标识
NSString * const mainSkill = @"主要技术点";
NSString * const projectLink = @"项目链接";


// 简历圆点图名称
NSString * const currentDot = @"current";
NSString * const otherDot = @"other";

// 右侧数据
// tabBar被选中的通知名字
NSString * const HXLTabBarDidSelectNotification = @"HXLTabBarDidSelectNotification";
CGFloat const HeadlineView_height = spaceThirty;



// 基类(也是段子)的重用标识;
NSString * const punReuseID = @"punReuseID";
// 我的页面的重用标识
NSString * const mineReuseID = @"mineReuseID";
// 设置界面重用标识
NSString * const settingReuseID = @"settingReuseID";
// 评论页面的重用标识;
NSString * const cmtReuseID = @"cmtReuseID";
// 评论页面 section 头部重用标识
NSString * const cmtHeaderReuseID = @"cmtHeaderReuseID";
// 推荐关注页面中 Category 的重用标识
NSString *const followCategoryReuseID = @"followCategoryReuseID";
// 推荐关注页面中 user 的重用标识
NSString *const followUserReuseID = @"followUserReuseID";
// 推荐标签页面中的重用标识
NSString *const recommentTagReuseID = @"recommentTagReuseID";

// 网络加载自定义每次加载条数
NSInteger const loadCount = 10;

// 评论页面 section 头部的高度
CGFloat const heightForHeaderInSection = spaceThirtyF;

// 基类的容器控件上, 中的高度, 竖直, 水平方向的间隙值
CGFloat const containTopView_hight = spaceTen * 5;
CGFloat const containDingView_hight = spaceForty;
CGFloat const Underline_height = 1;
/*

CGFloat const cellMargin_y = 1;
CGFloat const spaceTen = 10;
CGFloat const spaceTen = 10;
CGFloat const spaceFive = 5;
// 用户头像 icon 的占位小图片名
NSString *const placeholder = @"default_header_image_small";
// 用户头像 icon 的占位大图片名
NSString *const bigplaceholder = @"default_header_image_big";
 
// 评论页面 section 头部的高度
CGFloat const heightForHeaderInSection = 25;
// 我的页面中的 section 自动滚动距离 (这里系统滚动已经禁止, 但是依然有滚动, 通过setFrame 打印获得的值)
CGFloat const mineSectionSroll = 35;
// Mine 中方格总列数
NSInteger const cols = 4;
/
// 个人详情页面 tableView 下滚的调整距离
CGFloat scrollValue = 240+150;



// 网络加载自定义每次加载条数
NSInteger const loadCount = 10;
// 规定展示的热评数目
NSInteger const showHotCount = 3;
*/
