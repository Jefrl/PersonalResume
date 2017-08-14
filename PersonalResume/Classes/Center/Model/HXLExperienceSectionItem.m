//
//  HXLExperienceSectionItem.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLExperienceSectionItem.h"
#import "HXLExperienceItem.h"

@implementation HXLExperienceSectionItem
+ (instancetype)sectionItemWithDict:(NSDictionary *)dict
{
    HXLExperienceSectionItem *sectionItem = [[self alloc] init];

    [sectionItem setValuesForKeysWithDictionary:dict];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in sectionItem.projects) {
        HXLExperienceItem *item = [HXLExperienceItem itemWithDict:dict];
        [arrayM addObject:item];
    }
    
    sectionItem.projects = arrayM;
    return sectionItem;
}



@end
