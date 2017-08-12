//
//  HXLVideoTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by Jefrl on 17/3/13.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "HXLVideoView.h"
#import "HXLEssenceItem.h"
#import "HXLProgressView.h"
#import "UIImageView+WebCache.h"

#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HXLVideoView ()
/** 占位图片 */
@property (weak, nonatomic) IBOutlet UIImageView *placeholdImageView;
/** 失败加载的图片 */
@property (weak, nonatomic) IBOutlet UIImageView *loadError_imageView;
/** progressView */
@property (nonatomic, strong) IBOutlet HXLProgressView *progressView;
/** small_imageView */
@property (nonatomic, weak) IBOutlet UIImageView *smallImageView;
/** 播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
/** 播放次数 */
@property (weak, nonatomic) IBOutlet UILabel *playCounts;
/** 播放时间 */
@property (weak, nonatomic) IBOutlet UILabel *playTime;

/** 视频播放 VC */
@property (nonatomic, readwrite, strong) AVPlayerViewController *AVPlayerVC;
/** AVPlayer */
@property (nonatomic, readwrite, strong) AVPlayer *videoPlayer;

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
@property (nonatomic, readwrite, strong) MPMoviePlayerViewController *movePlayerVC;
#pragma clang diagnostic pop

@end

@implementation HXLVideoView
- (AVPlayer *)videoPlayer
{
        AVPlayer *player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:self.punCellItem.videouri]];
        _videoPlayer = player;

    return _videoPlayer;
}

- (AVPlayerViewController *)AVPlayerVC
{
    if (!_AVPlayerVC) {
        AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
        vc.player = self.videoPlayer;
        _AVPlayerVC = vc;
    }
    return _AVPlayerVC;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (MPMoviePlayerViewController *)movePlayerVC
{
    if (!_movePlayerVC) {
        _movePlayerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:self.punCellItem.videouri]];
    }
    return _movePlayerVC;
}
#pragma clang diagnostic pop

- (IBAction)playBtnClick:(UIButton *)sender {
    UITabBarController *tabBarC = (UITabBarController *)KEYWINDOW.rootViewController;
    UINavigationController *nav = (UINavigationController *)tabBarC.selectedViewController;
    
    self.AVPlayerVC.player = self.videoPlayer;
    [nav presentViewController:self.AVPlayerVC animated:YES completion:nil];
    [self.AVPlayerVC.player play];
}


#pragma mark - Init zone
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.smallImageView.clipsToBounds = YES;
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playBtnClick:)];
    
    [self addGestureRecognizer:tapGes];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.smallImageView.frame = self.punCellItem.pictureFrame;
    self.smallImageView.y = 0;
}

#pragma mark - setter zone
- (void)setPunCellItem:(HXLEssenceItem *)punCellItem
{
    _punCellItem = punCellItem;
    self.playCounts.text = [NSString stringFansFollowWithString:punCellItem.playcount];
    self.playTime.text = [NSString stringClockWithString:punCellItem.videotime];
    
    // 立马显示最新的进度值(防止因为网速慢, 导致显示的是其他图片的下载进度)
    [self.progressView setProgress:punCellItem.currentProgress animated:NO];
    
    [self.smallImageView sd_setImageWithURL:[NSURL URLWithString:_punCellItem.small_image] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        // 进来就要显示;
        self.progressView.hidden = NO;
        self.playBtn.hidden = YES;
        
        //        NSLog(@"%@, %ld, %ld, %.01f", @"progress", receivedSize, expectedSize, 1.00 * receivedSize/expectedSize);
        
        // 计算进度值
        punCellItem.currentProgress = 1.0 * receivedSize / expectedSize;
        // 显示进度值
        [self.progressView setProgress:punCellItem.currentProgress animated:NO];
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.1f%%", punCellItem.currentProgress * 100];
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        // 进来就要隐藏;
        self.progressView.hidden = YES;
        self.playBtn.hidden = NO;
        
        if (error) { // 网络加载失败就, 显示加载失败的图片;
            NSLog(@"%@", error);
            
            self.placeholdImageView.hidden = YES;
            self.loadError_imageView.hidden = NO;
            self.playBtn.hidden = NO;
            
            return ;
        }
        
        //         如果是大图片, 才需要进行绘图处理
        if (_punCellItem.isBigPicture == NO) return;
        
        // 开启图形上下文
        UIGraphicsBeginImageContextWithOptions(_punCellItem.pictureFrame.size, YES, 0.0);
        
        // 将下载完的image对象绘制到图形上下文
        CGFloat width = _punCellItem.pictureFrame.size.width;
        CGFloat height = image.size.height * width / image.size.width;
        
        [image drawInRect:CGRectMake(0, 0, width, height)];
        // 获得图片
        self.smallImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        self.size = image.size;
        
        // 结束图形上下文
        UIGraphicsEndImageContext();
        
    }];
    
}


@end
