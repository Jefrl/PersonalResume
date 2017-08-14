//
//  HXLBaseTVC.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXLBaseTVC : UITableViewController
/** contents */
@property (nonatomic, readwrite, strong) NSArray *contents;

- (void)setupUI;
- (NSArray *)getArrayWithFileName:(NSString *)fileName;

@end
