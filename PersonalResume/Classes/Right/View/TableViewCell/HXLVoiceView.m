//
//  HXLVoiceTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by Jefrl on 17/3/13.
//  Copyright © 2017年 com.Jefrl.www. All rights reserved.
//

#import "HXLVoiceView.h"
#import "HXLEssenceItem.h"
#import "HXLShowBigPictureViewController.h"
#import "HXLProgressView.h"
#import "UIImageView+WebCache.h"

#import <AVKit/AVKit.h>
//#import <AVFoundation/AVFoundation.h>
#import "HXLAudioTool.h"

@interface HXLVoiceView ()
/** 占位图片 */
@property (weak, nonatomic) IBOutlet UIImageView *placeholdImageView;
/** small_imageView */
@property (nonatomic, weak) IBOutlet UIImageView *smallImageView;
/** 失败加载的图片 */
@property (weak, nonatomic) IBOutlet UIImageView *loadError_imageView;
/** progressView */
@property (nonatomic, strong) IBOutlet HXLProgressView *progressView;
/** 音频播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
/** 播放次数 */
@property (weak, nonatomic) IBOutlet UILabel *playCounts;
/** 播放时间 */
@property (weak, nonatomic) IBOutlet UILabel *playTime;

/** 音频播放 VC */
/** audioPlayer */
@property (nonatomic, readwrite, strong) AVAudioPlayer *audioPlayer;
//@property (nonatomic, readwrite, strong) AVPlayerViewController *AVPlayerVC;
/** 播放状态的 imageView */
@property (nonatomic, readwrite, strong) UIImageView *imageView;
/** AudioTool */
@property (nonatomic, readwrite, strong) HXLAudioTool *audioTool;
/** previouBtn */
@property (nonatomic, readwrite, strong) UIButton *previouBtn;
/** preImageView */
@property (nonatomic, readwrite, strong) UIImageView *preImageView;

@end

@implementation HXLVoiceView
#pragma mark - 懒加载
//- (AVPlayerViewController *)AVPlayerVC
//{
//    if (!_AVPlayerVC) {
//        AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
//        vc.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:self.punCellItem.voiceuri]];
//        
//        _AVPlayerVC = vc;
//    }
//    return _AVPlayerVC;
//}

- (HXLAudioTool *)audioTool
{
    if (!_audioTool) {
        HXLAudioTool *tool = [HXLAudioTool shareHXLAudioTool];
        _audioTool = tool;
    }
    return _audioTool;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showVoice-voice8"]];
        imageView.frame = self.playBtn.frame;
        imageView.userInteractionEnabled = YES;
        imageView.hidden = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTagGesture:)];
        [imageView addGestureRecognizer:tapGesture];
        
        [KEYWINDOW addSubview:imageView];
        _imageView = imageView;
        
        // 帧动画
        // 创建图片对象
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 1; i <= 8; i ++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d",@"showVoice-voice", i]];
            [images addObject:image];
        }
        
        imageView.animationImages = images;
        imageView.animationDuration = 8 * 0.1;
        imageView.animationRepeatCount = 0; // 重复播放
        
    }
    return _imageView;
}


#pragma mark - 响应方法区域
- (IBAction)playBtnClick:(UIButton *)sender {
    
    if (self.previouBtn == sender) {
        sender.selected = !sender.selected;
        if (sender.selected) { // 现在是选中的播放状态
            sender.hidden = NO;
            [self.preImageView startAnimating];
            self.preImageView.hidden = NO;
            
            [self.audioTool playAudio:_punCellItem.voiceuri];
        
        } else { // 现在是非选中的暂停状态;
            sender.hidden = NO;
            [self.preImageView stopAnimating];
            self.preImageView.hidden = YES;
            
            [self.audioTool pauseAudio];
        }
        return;
#pragma mark - bug bug 如果点击另一个 cell 上的按钮, 如何恢复之前的按钮, 取消之前 imageView(给它单例么), 还是一个个取消掉; 再重新开启对应的; 为什么会有空白选项, cell 的重复利用没有重新加载么??)
        
    }
    
    // 非同一个按钮时, 恢复上次记录的按钮和 上次 imageView 的动画暂停并移除
    self.previouBtn.hidden = NO;
    [self.preImageView stopAnimating];
    [self.preImageView removeFromSuperview];
    // 显现并开启本次的控件
    self.playBtn.hidden = YES;
    self.imageView.hidden = NO;
    [self.imageView startAnimating];
    // 重新记录的按钮和 imageView 并开启动画
    self.previouBtn = self.playBtn;
    self.preImageView = self.imageView;
    
    HXL_WEAKSELF;
    [self.audioTool setStartAnimation:^{
        HXL_STRONGSELF;
        [strongSelf startAnimation];
    }];
    [self.audioTool setStopAnimation:^{
        HXL_STRONGSELF;
        [strongSelf stopAnimation];
    }];
    
    
    [self.audioTool playAudio:_punCellItem.voiceuri];
}

- (void)imageViewTagGesture:(UITapGestureRecognizer *)sender
{
    [self.audioTool pauseAudio];
}

// 这里简单处理了, 以后优化的
- (void)startAnimation
{
    [self.imageView startAnimating];
    self.playBtn.hidden = YES;
    self.imageView.hidden = NO;
}

- (void)stopAnimation {
    [self.imageView stopAnimating];
    self.playBtn.hidden = NO;
    self.imageView.hidden = YES;
}

- (void)seeBigPicture {
    
    HXLShowBigPictureViewController *showBigPicVC = [[HXLShowBigPictureViewController alloc] init];
    
    showBigPicVC.punCellItem = self.punCellItem;
    
    UITabBarController *rootVC = (UITabBarController *)KEYWINDOW.rootViewController;
    [rootVC presentViewController:showBigPicVC animated:YES completion:nil];
    
}

#pragma mark - init zone
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.smallImageView.clipsToBounds = YES;
    self.playBtn.hidden = NO;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigPicture)];
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
    self.playTime.text = [NSString stringClockWithString:punCellItem.voicetime];
    
    // 立马显示最新的进度值(防止因为网速慢, 导致显示的是其他图片的下载进度)
    [self.progressView setProgress:punCellItem.currentProgress animated:NO];
    
    [self.smallImageView sd_setImageWithURL:[NSURL URLWithString:_punCellItem.small_image] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        // 进来就要显示;
        self.progressView.hidden = NO;
        
        //        NSLog(@"%@, %ld, %ld, %.01f", @"progress", receivedSize, expectedSize, 1.00 * receivedSize/expectedSize);
        
        // 计算进度值
        punCellItem.currentProgress = 1.0 * receivedSize / expectedSize;
        // 显示进度值
        [self.progressView setProgress:punCellItem.currentProgress animated:NO];
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.1f%%", punCellItem.currentProgress * 100];
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        // 进来就要隐藏;
        self.progressView.hidden = YES;
        
        if (error) { // 网络加载失败就, 显示加载失败的图片;
            NSLog(@"%@", error);
            
            self.placeholdImageView.hidden = YES;
            self.loadError_imageView.hidden = NO;
            
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
