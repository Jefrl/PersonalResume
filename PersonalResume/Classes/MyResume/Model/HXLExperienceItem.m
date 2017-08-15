//
//  HXLExperienceItem.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLExperienceItem.h"

@implementation HXLExperienceItem

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    HXLExperienceItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

// 如果外界传进来的字典, 有值为 null 防止崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
