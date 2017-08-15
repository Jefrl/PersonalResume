//
//  HXLMusicViewController.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLMusicViewController.h"
#import "PersonalResume-Swift.h"

@interface HXLMusicViewController ()
@property (weak, nonatomic) IBOutlet UIButton *enterBtn;

@end

@implementation HXLMusicViewController
- (IBAction)enterBtnClick:(UIButton *)sender {
    HXLMusicListTVC *listTVC = [[HXLMusicListTVC alloc] init];
    [self.navigationController pushViewController:listTVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES animated:YES];
}





@end
