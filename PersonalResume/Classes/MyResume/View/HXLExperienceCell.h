//
//  HXLExperienceCell.h
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HXLExperienceItem;

@interface HXLExperienceCell : UITableViewCell
/** HXLExperienceItem */
@property (nonatomic, readwrite, strong) HXLExperienceItem *item;

@end
