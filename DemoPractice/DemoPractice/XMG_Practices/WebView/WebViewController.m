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

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    WKWebView *wkWebView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:wkWebView];

}



@end
