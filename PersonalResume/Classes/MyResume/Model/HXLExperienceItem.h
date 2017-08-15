//
//  HXLExperienceItem.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXLExperienceItem : NSObject
/** title */
@property (nonatomic, readwrite, strong) NSString *title;
/** titleContent */
@property (nonatomic, readwrite, strong) NSString *titleContent;
/** aClass 绑定相关类名 */
@property (nonatomic, readwrite, strong) Class objectClass;
/** operation */
@property (nonatomic, readwrite, copy) void (^operation)();


+ (instancetype)itemWithDict:(NSDictionary *)dict;



@end
