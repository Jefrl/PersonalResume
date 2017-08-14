//
//  HXLContentTool.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/13.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLContentTool.h"

@implementation HXLContentTool
+ (NSArray *)getResumeArrayWithFile:(NSString *)fileName
{
    NSString *contentPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSString *content = [NSString stringWithContentsOfFile:contentPath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *contents = [content componentsSeparatedByString:@"\n"];
    NSLog(@"count: %ld, \n %@", contents.count, contents);
    
    return contents;
}

+ (NSArray *)getResumeArrayWithPlist:(NSString *)fileName
{
    NSString *contentPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *contents = [NSArray arrayWithContentsOfFile:contentPath];
    NSLog(@"count: %ld, \n %@", contents.count, contents);
    
    return contents;
}

@end
