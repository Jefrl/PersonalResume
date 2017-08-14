//
//  HXLContentTool.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXLContentTool : NSObject
+ (NSArray *)getResumeArrayWithFile:(NSString *)fileName;
+ (NSArray *)getResumeArrayWithPlist:(NSString *)fileName;

@end
