//
//  HXLBaseTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLBaseTVC.h"
#import "HXLSkillCell.h"
#import "HXLSkillItem.h"

#import "HXLContentTool.h"

@interface HXLBaseTVC ()

@end

@implementation HXLBaseTVC

#pragma mark ===================== 基类初始化 =====================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)setupUI
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HXLSkillCell class]) bundle:nil] forCellReuseIdentifier:skillReuseID];
    
    self.tableView.estimatedRowHeight = 22;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = GRAY_WHITE_COLOR;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark ===================== 功能模块 =====================
// 数据处理
- (NSArray *)getArrayWithFileName:(NSString *)fileName
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [HXLContentTool getResumeArrayWithFile:fileName];
    
    for (NSString *skillStr in array) { // 去掉空字符
        NSLog(@"__%@__", skillStr);
        if ([skillStr isEqualToString: @""]) continue;
        [arrayM addObject:skillStr];
    }
    return arrayM;
}

#pragma mark ============== TableView data source ==============

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HXLSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:skillReuseID forIndexPath:indexPath];
    
    NSString *dot = (indexPath.row % 2 == 0) ? currentDot : otherDot;
    cell.item = [HXLSkillItem itemWithDotImage:dot skillText:self.contents[indexPath.row]];
    cell.contentView.backgroundColor = GRAY_WHITE_COLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
