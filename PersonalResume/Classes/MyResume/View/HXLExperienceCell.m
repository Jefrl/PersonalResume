//
//  HXLExperienceCell.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLExperienceCell.h"
#import "HXLExperienceItem.h"

@interface HXLExperienceCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *titleContent;


@end

@implementation HXLExperienceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setItem:(HXLExperienceItem *)item
{
    _item = item;
    self.title.text = item.title;
    self.titleContent.text = item.titleContent;
    
    self.accessoryType = UITableViewCellAccessoryNone;
    if (item.objectClass) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
}

@end
