//
//  WebViewComtroller.m
//  skZone
//
//  Created by sm on 2019/4/12.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "WebViewComtroller.h"

@interface WebViewComtroller () <UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewComtroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView.scalesPageToFit = YES;//允许缩放
    
    NSURL *url;
    if ([_url characterAtIndex:0] == 'h') {
        url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", _url]];
    } else {
        url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://%@", _url]];
    }
    
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    _webView.delegate = self;
    
}



- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    SHOW_DISMISS
    
    
}


#pragma mark - webview代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    SHOW_INFO(LocalizedString(@"加载中"))
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    SHOW_DISMISS
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    SHOW_ERROR(LocalizedString(@"失败"))
    
}


@end
