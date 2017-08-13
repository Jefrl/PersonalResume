//
//  HXLSkillCell.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLSkillCell.h"
#import "HXLSkillItem.h"

@interface HXLSkillCell ()
@property (weak, nonatomic) IBOutlet UIImageView *dot;
@property (weak, nonatomic) IBOutlet UILabel *skill;


@end

@implementation HXLSkillCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

- (void)setItem:(HXLSkillItem *)item
{
    _item = item;
    _dot.image = item.dotImage;
    _skill.text = item.skillText;
}


@end
