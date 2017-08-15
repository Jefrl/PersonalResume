//
//  HXLSkillItem.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXLSkillItem : NSObject
/** dotImage */
@property (nonatomic, readwrite, strong) UIImage *dotImage;
/** skillText */
@property (nonatomic, readwrite, strong) NSString *skillText;

+ (instancetype)itemWithDotImage:(NSString *)dot skillText:(NSString *)skillText;
@end
