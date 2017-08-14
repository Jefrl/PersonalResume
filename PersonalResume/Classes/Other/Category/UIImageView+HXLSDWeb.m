//
//  UIImageView+HXLSDWeb.m
//  CustomClass
//
//  Created by Jefrl on 17/3/23.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "UIImageView+HXLSDWeb.h"
#import "UIImageView+WebCache.h"
#import "UIImage+HXLRenderOriginal.h"


@implementation UIImageView (HXLSDWeb)

- (void)setImageString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage circleImage:(BOOL)isYes
{
    
    NSURL *imageUrl = [NSURL URLWithString:urlString];
    if (!isYes) {
        [self sd_setImageWithURL:imageUrl placeholderImage:placeholderImage];
    } else {
        
        [self sd_setImageWithURL:imageUrl placeholderImage:placeholderImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
           
            if (nil == image) { // 有些用户不设置头像, 默认一个头像;
                image = placeholderImage;
            }
        
            // 获取圆形头像
            UIImage *circleImage = [UIImage imageCircleClipWithImage:image];
            // 赋值给控件
            self.image = circleImage;
        }];
    }
}


@end
