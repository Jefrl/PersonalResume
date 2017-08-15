//
//  HXLProjectLinkWebVC.m
//  PersonalResume
//
//  Created by Jefrl on 2017/8/14.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

#import "HXLProjectLinkWebVC.h"

#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface HXLProjectLinkWebVC ()<UIWebViewDelegate, NJKWebViewProgressDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goRefresh;
// 还可以用框架的 View
//@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

/** progressV */
@property (nonatomic, readwrite, strong) NJKWebViewProgressView *progressV;
@property (strong, nonatomic) NJKWebViewProgress *progressProxy;

@end

@implementation HXLProjectLinkWebVC

#pragma mark ===================== 初始化区域 =====================
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 进度对象的代理设置为 self, 实现进度方法
     _progressProxy = [[NJKWebViewProgress alloc] init];
     _progressProxy.progressDelegate = self;
    
    // 首先进度对象设置为 webView 的代理
    self.webView.delegate = _progressProxy;
    // 然后进度对象的 web代理的代理 设置为 self; 绕一圈去激活系统 UIWebView 的代理方法, 实现 webViewDidFinishLoad 方法
    _progressProxy.webViewProxyDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    
    _progressV = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressV];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_progressV removeFromSuperview];
}

#pragma mark ===================== 方法响应区域 =====================
- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self.webView goBack];
}
- (IBAction)goForward:(UIBarButtonItem *)sender {
    [self.webView goForward];
}
- (IBAction)goRefresh:(UIBarButtonItem *)sender {
    [self.webView reload];
    
}

#pragma mark - <UIWebViewDelegate>
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.goBack.enabled = webView.canGoBack;
    self.goForward.enabled = webView.canGoForward;
    
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressV setProgress:progress animated:YES];
}


@end
