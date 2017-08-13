//
//  HXLSkillItem.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLSkillItem.h"

@implementation HXLSkillItem
+ (instancetype)itemWithDotImage:(NSString *)dot skillText:(NSString *)skillText
{
    HXLSkillItem *item = [[self alloc] init];
    item.dotImage = [UIImage imageNamed:dot];
    item.skillText = skillText;
    return item;
}

@end
