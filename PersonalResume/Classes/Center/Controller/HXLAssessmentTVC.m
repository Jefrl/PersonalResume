//
//  HXLAssessmentTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLAssessmentTVC.h"
#import "HXLContentTool.h"
#import "HXLAssessmentCell.h"
#import "HXLSkillItem.h"

@interface HXLAssessmentTVC ()
/** contents */
@property (nonatomic, readwrite, strong) NSMutableArray *contentsM;

@end

@implementation HXLAssessmentTVC

#pragma mark ===================== 懒加载 =====================
- (NSArray *)contentsM
{
    if (!_contentsM) {
        NSMutableArray *arrayM = [NSMutableArray array];
        NSArray *array = [HXLContentTool getResumeArrayWithFile:hxlAssessment];
        
        for (NSString *skillStr in array) {
//            NSLog(@"__%@__", skillStr);
            if ([skillStr isEqualToString: @""]) continue;
            [arrayM addObject:skillStr];
        }
        _contentsM = arrayM;
    }
    return _contentsM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ HXLAssessmentCell class]) bundle:nil] forCellReuseIdentifier:assessmentReuseID];
    
    self.tableView.estimatedRowHeight = 10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = GRAY_WHITE_COLOR;
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
    HXLAssessmentCell *cell = [tableView dequeueReusableCellWithIdentifier:assessmentReuseID forIndexPath:indexPath];
    
    NSString *dot = (indexPath.row % 2 == 0) ? currentDot : otherDot;
    cell.item = [HXLSkillItem itemWithDotImage:dot skillText:self.contentsM[indexPath.row]];
    cell.backgroundColor = GRAY_WHITE_COLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
