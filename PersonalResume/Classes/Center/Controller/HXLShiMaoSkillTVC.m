//
//  HXLShiMaoSkillTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLShiMaoSkillTVC.h"

@interface HXLShiMaoSkillTVC ()

/** contentsM */
@property (nonatomic, readwrite, strong) NSArray *contentsM;

@end

@implementation HXLShiMaoSkillTVC

- (NSArray *)contentsM
{
    if (!_contentsM) {
        NSArray *arrayM = [self getArrayWithFileName:ShiMaoSkill];
        _contentsM = arrayM;
    }
    return _contentsM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contents = self.contentsM;
    [self setupUI];
}

@end
