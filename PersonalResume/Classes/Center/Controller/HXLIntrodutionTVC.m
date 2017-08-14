//
//  HXLIntrodutionTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLIntrodutionTVC.h"
#import "HXLContentTool.h"

@interface HXLIntrodutionTVC ()
/** contents */
@property (nonatomic, readwrite, strong) NSArray *contents;

@end

@implementation HXLIntrodutionTVC

#pragma mark ===================== 懒加载 =====================
- (NSArray *)contents
{
    if (!_contents) {
        NSArray *array = [HXLContentTool getResumeArrayWithFile:hxlIntroduction];
        _contents = array;
    }
    return _contents;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:introReuseID];
    
    self.tableView.estimatedRowHeight = 44;
    self.tableView.backgroundColor = GRAY_WHITE_COLOR;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark ===================== TableView data source =====================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:introReuseID forIndexPath:indexPath];
    cell.textLabel.text = self.contents[indexPath.row];
    cell.backgroundColor = GRAY_WHITE_COLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


@end
