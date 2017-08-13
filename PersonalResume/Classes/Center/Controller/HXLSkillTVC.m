//
//  HXLSkillTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLSkillTVC.h"
#import "HXLContentTool.h"
#import "HXLSkillCell.h"
#import "HXLSkillItem.h"

@interface HXLSkillTVC ()

/** contents */
@property (nonatomic, readwrite, strong) NSMutableArray *contentsM;

@end

@implementation HXLSkillTVC

#pragma mark ===================== 懒加载 =====================
- (NSArray *)contentsM
{
    if (!_contentsM) {
        NSMutableArray *arrayM = [NSMutableArray array];
        NSArray *array = [HXLContentTool getResumeArrayWithFile:hxlSkill];
        
        for (NSString *skillStr in array) {
            NSLog(@"__%@__", skillStr);
            if ([skillStr isEqualToString: @""]) continue;
            [arrayM addObject:skillStr];
        }
        _contentsM = arrayM;
    }
    return _contentsM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HXLSkillCell class]) bundle:nil] forCellReuseIdentifier:skillReuseID];
    
    self.tableView.estimatedRowHeight = 22;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = GRAY_PUBLIC_COLOR;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contentsM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HXLSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:skillReuseID forIndexPath:indexPath];
    
    NSString *dot = (indexPath.row % 2 == 0) ? currentDot : otherDot;
    cell.item = [HXLSkillItem itemWithDotImage:dot skillText:self.contentsM[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
