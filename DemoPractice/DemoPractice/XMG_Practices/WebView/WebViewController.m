//
//  WebViewController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@property(strong,nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_webView.configuration.userContentController addScriptMessageHandler:self name:@"GetKeyiOSAndroid_Action"];
    [_webView.configuration.userContentController addScriptMessageHandler:self name:@"Upload_Action"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    WKWebViewConfiguration*config = [[WKWebViewConfiguration alloc]init];
    config.selectionGranularity = WKSelectionGranularityCharacter;
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:_webView];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_webView.configuration.userContentController removeScriptMessageHandlerForName:@"GetKeyiOSAndroid_Action"];
    [_webView.configuration.userContentController removeScriptMessageHandlerForName:@"Upload_Action"];
    
}

@end
