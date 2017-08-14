//
//  HXLExperienceSectionItem.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXLExperienceSectionItem : NSObject

/** header */
@property (nonatomic, readwrite, strong) NSString *header;
/** project */
@property (nonatomic, readwrite, strong) NSArray *projects;

+ (instancetype)sectionItemWithDict:(NSDictionary *)dict;

@end
