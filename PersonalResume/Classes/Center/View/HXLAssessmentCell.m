//
//  HXLAssessmentCell.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLAssessmentCell.h"
#import "HXLSkillItem.h"

@interface HXLAssessmentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *dot;
@property (weak, nonatomic) IBOutlet UILabel *skill;

@end

@implementation HXLAssessmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"%@", NSStringFromCGRect(self.frame));
}


- (void)setItem:(HXLSkillItem *)item
{
    _item = item;
    _dot.image = item.dotImage;
    _skill.text = item.skillText;
}


@end
