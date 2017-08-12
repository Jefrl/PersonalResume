//
//  HXLMusicTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/11.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLMusicTVC.h"

@interface HXLMusicTVC ()

@end

@implementation HXLMusicTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    return cell;
}


@end
