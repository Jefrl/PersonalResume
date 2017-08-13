//
//  HXLPersonalResumeVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/11.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLPersonalResumeVC.h"
#import "HXLIntrodutionTVC.h"
#import "HXLSkillTVC.h"
#import "HXLExperienceTVC.h"
#import "HXLAssessmentTVC.h"

#import "HXLPopButton.h"

#import "POP.h"
#import "SVProgressHUD.h"

@interface HXLPersonalResumeVC ()
/** 动画时间数组 */
@property (nonatomic, strong) NSArray *timeArray;
/** 按钮数组 */
@property (nonatomic, strong) NSMutableArray * fiveBtnArray;

@end

@implementation HXLPersonalResumeVC

#pragma mark ===================== 懒加载 =====================
- (NSMutableArray *)fiveBtnArray {
    if (!_fiveBtnArray) {
        _fiveBtnArray = [NSMutableArray array];
    }
    return _fiveBtnArray;
}

- (NSArray *)timeArray {
    if (!_timeArray) {
        
        CGFloat unitInterval = 0.1;
        NSArray *timeArray = @[
                               @(2 * unitInterval), //个人资料
                               @(4 * unitInterval), //专业技能
                               @(3 * unitInterval), //工作经历
                               @(1 * unitInterval), //自我评价
                               @(0 * unitInterval), //联系我
                               @(5 * unitInterval)  //简历标题;
                               ];
        _timeArray = timeArray;
    }
    
    return _timeArray;
}

#pragma mark ===================== 初始化 =====================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 开始动画取消交互
    self.view.userInteractionEnabled = NO;
    
    // view 的背景图设置
    UIImageView *bg_imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shareBottomBackground"]];
    bg_imageView.frame = self.view.bounds;
    [self.view addSubview:bg_imageView];
    

    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    // 所有按钮的搭建
    [self setupAllButton];
    // 标题的创建
    [self setupSlogan];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    for (UIButton *btn in self.fiveBtnArray) {
        [btn removeFromSuperview];
    }
    [self.fiveBtnArray removeAllObjects];
    self.fiveBtnArray = nil;
}

#pragma mark ===================== 消息区域 =====================

// 标题的创建
- (void)setupSlogan {
    UILabel *appSlogan = [[UILabel alloc] init];
    appSlogan.text = @"我 的 简 历";
    appSlogan.font = FONT_30;
    appSlogan.textAlignment = NSTextAlignmentCenter;
    
    // 空隙分别 1/5, 标题宽 3/5, 后续有宽度
    CGFloat slogan_X = HXL_SCREEN_WIDTH * 0.2;
    CGFloat sloganEnd_centerY = HXL_SCREEN_HEIGHT * 0.15;
    CGFloat sloganStart_centerY = - sloganEnd_centerY;
    appSlogan.center = CGPointMake(slogan_X , sloganStart_centerY);
    
    // 保存最后动画者
    [self.fiveBtnArray addObject:appSlogan];
    [self.view addSubview:appSlogan];
    
    // 标题的 pop 动画
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(slogan_X, sloganStart_centerY, slogan_X * 3, spaceForty)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(slogan_X, sloganEnd_centerY, slogan_X * 3, spaceForty)];
    anim.springSpeed = spaceTwenty;
    anim.springBounciness = spaceTwenty;
    anim.beginTime = CACurrentMediaTime() + [self.timeArray[5] doubleValue];
    
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        // 开启交互;
        self.view.userInteractionEnabled = YES;
    }];
    
    [appSlogan pop_addAnimation:anim forKey:nil];
}

// 所有按钮的搭建
- (void)setupAllButton {
    
    // 退出个人简历的按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"退出简历" forState: UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    backBtn.backgroundColor = GRAY_WHITE_COLOR;
    backBtn.frame = CGRectMake(0, HXL_SCREEN_HEIGHT - tabBarHeight, HXL_SCREEN_WIDTH, tabBarHeight);
    [backBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    // 5个按钮的创建
    NSArray *titleLabelArray = @[@"基本资料", @"专业技能", @"工作经历", @"自我评价", @"联系我"];
    NSArray *imageNameArray = @[[UIImage imageNamed:@"publish-video"], [UIImage imageNamed:@"publish-picture"], [UIImage imageNamed:@"publish-text"], [UIImage imageNamed:@"publish-audio"], [UIImage imageNamed:@"publish-link"]];
    
    NSInteger btnCount = titleLabelArray.count;
    NSInteger colCountMax = 3;
    CGFloat spaceY = spaceFifteen;
    CGFloat distance = spaceThirty;
    CGFloat btnW = (HXL_SCREEN_WIDTH - (colCountMax - 1) * distance - 2 * spaceTen) / colCountMax;
    CGFloat btnH = btnW * 1.2;
    for (int i = 0; i < btnCount; i++) {
        
        UIButton *btn = [HXLPopButton buttonWithType:UIButtonTypeCustom];
        btn.y = - btnH;
        [btn setImage:imageNameArray[i] forState:UIControlStateNormal];
        [btn setTitle:titleLabelArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        // 保存按钮
        [self.fiveBtnArray addObject:btn];
        [self.view addSubview:btn];
        
        NSInteger colIndex = i % colCountMax;
        NSInteger rowIndex = i / colCountMax;
        CGFloat btnX = (btnW + distance) * colIndex + spaceTen;
        CGFloat btnEndY = (0.33 * HXL_SCREEN_HEIGHT) + (btnH + spaceY) * rowIndex;
        CGFloat btnStartY = - btnH;
        
        // btn 的 pop 动画
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnStartY, btnW, btnH)];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        animation.springSpeed = spaceFifteen;
        animation.springBounciness = spaceTen;
        animation.beginTime = CACurrentMediaTime() + [self.timeArray[i] doubleValue];
        // 执行动画
        [btn pop_addAnimation:animation forKey:nil];
        
    }
}


#pragma mark ===================== 抽取或响应的方法 =====================
// 五个按钮的点击事件
- (void)btnClick:(UIButton *)sender {
    NSInteger num = sender.tag;
    if (num == ButtonTypeIntroduction) { // 个人资料
        HXLIntrodutionTVC *introdutionTVC = [[HXLIntrodutionTVC alloc] init];
        introdutionTVC.title = sender.titleLabel.text;
        [self resumeBtnPushVC:introdutionTVC];
    } else if (num == ButtonTypeSkill) { // 专业技能
        HXLSkillTVC *skillTVC = [[HXLSkillTVC alloc] init];
        skillTVC.title = sender.titleLabel.text;
        [self resumeBtnPushVC:skillTVC];
    } else if (num == ButtonTypeExperience) { // 工作经验
        HXLExperienceTVC *experienceTVC = [[HXLExperienceTVC alloc] init];
        experienceTVC.title = sender.titleLabel.text;
        [self resumeBtnPushVC:experienceTVC];
    } else if (num == ButtonTypeAssessment) { // 自我评价
        HXLAssessmentTVC *assessmentTVC = [[HXLAssessmentTVC alloc] init];
        assessmentTVC.title = sender.titleLabel.text;
        [self resumeBtnPushVC:assessmentTVC];
    } else if (num == ButtonTypeContact) { // 联系我
        [SVProgressHUD showWithStatus:@"后期迭代更新 !"];
        [SVProgressHUD dismissWithDelay:1];
    }
}

// 点击屏幕
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self btnViewDisappearWithPop:nil];
}

// 退出按钮的点击
- (void)cancelBtnClick:(UIButton *)cancelbtn {
    // 让6个动画执行完
    [self btnViewDisappearWithPop:nil];
}

// 点击简历按钮跳转的方法
- (void)resumeBtnPushVC:(UIViewController *)vc
{
    HXL_WEAKSELF;
    [self btnViewDisappearWithPop:^{
        HXL_STRONGSELF;
        [strongSelf.navigationController pushViewController:vc animated:YES];
        strongSelf.navigationController.navigationBarHidden = NO;
    }];
}

// 让6个动画执行完消失
- (void)btnViewDisappearWithPop:(void (^)())complete_block {
    // 禁止互交
    self.view.userInteractionEnabled = NO;
    
    NSInteger totalCount = self.fiveBtnArray.count;
    for (int i = 0; i < totalCount; i++) {
        UIView *btnView = self.fiveBtnArray[i];
        
        CGFloat btnX = btnView.x;
        CGFloat btnStartY = btnView.y;
        CGFloat btnEndY = btnStartY + HXL_SCREEN_HEIGHT;
        CGFloat btnW = btnView.width;
        CGFloat btnH = btnView.height;
        
        // btnView 的 pop 动画
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnStartY, btnW, btnH)];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        animation.springSpeed = spaceTwenty;
        animation.springBounciness = spaceFive;
        animation.beginTime = CACurrentMediaTime() + [self.timeArray[i] doubleValue];
        // 执行动画
        [btnView pop_addAnimation:animation forKey:nil];
        
        HXL_WEAKSELF; // 弱指向
        if (i == totalCount - 1) { // 最后一个动画了
            [animation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
                HXL_STRONGSELF;
                
                // block 有值才调用
                if (!complete_block) {
                    // 代码块执行完毕, 这里为局部变量, 会释放;
                    [strongSelf dismissViewControllerAnimated:NO completion:nil];
                } else {
                    
                    complete_block();
                }
            }];
        }
    }
}


@end
