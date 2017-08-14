//
//  NSString+HXL.m
//  CustomClass
//
//  Created by Jefrl on 2017/7/18.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "NSString+HXL.h"

@implementation NSString (HXL)
+ (instancetype)stringFansFollowWithString:(NSString *)string
{
    NSInteger fanCount = [string integerValue];
    
    if (fanCount >= 10000) {
        if ((fanCount % 10000) == 0) {
            return [NSString stringWithFormat:@"%ld 万", fanCount / 10000];
        }
        
        CGFloat value = (CGFloat)fanCount / 10000;
        return [NSString stringWithFormat:@"%.2f 万", value];
    }
    
    return [NSString stringWithFormat:@"%ld", fanCount];
}

+ (instancetype)stringClockWithString:(NSString *)string
{
    NSInteger fanCount = [string integerValue];
    
    if (fanCount >= 60) {
        if (fanCount % 60 == 0) {
            NSInteger min = fanCount / 60;
            return [NSString stringWithFormat:@"%ld : 00", min];
        }
        NSInteger min = fanCount / 60;
        NSInteger sec = fanCount % 60;
        return [NSString stringWithFormat:@"%ld : %ld", min, sec];
    }
    
    return [NSString stringWithFormat:@"%ld", fanCount];
}

@end
