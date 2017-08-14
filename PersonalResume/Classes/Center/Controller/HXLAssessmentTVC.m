//
//  HXLAssessmentTVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLAssessmentTVC.h"
#import "HXLContentTool.h"
#import "HXLSkillItem.h"

@interface HXLAssessmentTVC ()
/** contentsM */
@property (nonatomic, readwrite, strong) NSArray *contentsM;

@end

@implementation HXLAssessmentTVC

#pragma mark ===================== 懒加载 =====================
- (NSArray *)contentsM
{
    if (!_contentsM) {
        NSArray *arrayM = [self getArrayWithFileName:hxlAssessment];
        _contentsM = arrayM;
    }
    return _contentsM;
}

- (void)viewDidLoad
{
    self.contents = self.contentsM;
    [self setupUI];
}


@end
