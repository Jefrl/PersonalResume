//
//  HXLExperienceTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLExperienceTVC.h"
#import "HXLMiYiSkillTVC.h"
#import "HXLShiMaoSkillTVC.h"
#import "HXLExperienceSectionItem.h"
#import "HXLExperienceItem.h"
#import "HXLExperienceCell.h"
#import "HXLContentTool.h"

#import "HXLProjectLinkWebVC.h"


@interface HXLExperienceTVC ()
/** contents */
@property (nonatomic, readwrite, strong) NSArray *contents;
/** headerSection */
@property (nonatomic, readwrite, strong) UIView *headerSection;

@end

@implementation HXLExperienceTVC

#pragma mark ===================== 懒加载 =====================
- (NSArray *)contents
{
    if (!_contents) {
        
        NSArray *array = [HXLContentTool getResumeArrayWithPlist:hxlExperience];
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            HXLExperienceSectionItem *sectionItem = [HXLExperienceSectionItem sectionItemWithDict:dict];
            [arrayM addObject:sectionItem];
        }
        _contents = arrayM;
    }
    return _contents;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HXLExperienceCell class]) bundle:nil] forCellReuseIdentifier:experienceReuseID];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark ===================== TableView data source =====================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.contents.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HXLExperienceSectionItem *sectionItem = self.contents[section];
    return sectionItem.projects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HXLExperienceSectionItem *sectionItem = self.contents[indexPath.section];
    HXLExperienceItem *item = sectionItem.projects[indexPath.row];
    
    HXLExperienceCell *cell = [tableView dequeueReusableCellWithIdentifier:experienceReuseID];
    
    if ([item.title containsString:mainSkill]) { // 标记跳转 cell
        item.objectClass = (indexPath.section == 0) ? [HXLMiYiSkillTVC class] : [HXLShiMaoSkillTVC class];
    }
    
    if ([item.title containsString:projectLink]) { // 换种 Block 的方式, 浪起来
        __weak typeof(item) weakItem = item;
        
        HXL_WEAKSELF;
        item.operation = ^{
            HXL_STRONGSELF;
            
            HXLProjectLinkWebVC *webViewController = [[HXLProjectLinkWebVC alloc] init];
            webViewController.title = weakItem.title;
            webViewController.url = weakItem.titleContent;
            [strongSelf.navigationController pushViewController:webViewController animated:YES];
        };
    }
    
    cell.item = item;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HXL_SCREEN_WIDTH, spaceThirtyF)];
    view.backgroundColor = GRAY_PUBLIC_COLOR;
    self.headerSection = view;
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = [self.contents[section] header];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = FONT_B_18;
    [view addSubview:label];
    
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return spaceThirtyF;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HXLExperienceCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) { // 有箭头的
        if (cell.item.objectClass) { // 有绑定类名
            UIViewController *vc = [[cell.item.objectClass alloc] init];
            vc.title = cell.item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        // 没值的时候, 切不可执行 Block;
        !cell.item.operation ? : cell.item.operation();
        
    }
}


@end
