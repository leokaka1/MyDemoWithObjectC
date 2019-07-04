//
//  MainPage.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "MainPage.h"
#import "MainPage+OtherFunction.h"
#import "Person.h"
#import "AppDelegate.h"

static NSString *identifier = @"cell";

@interface MainPage ()

@property(strong,nonatomic) NSDictionary *dict;

@end

@implementation MainPage


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    MainPageModel *model = [[MainPageModel alloc]initWithDict:[ConstDictionary getMainDictionary]];
    self.titleArr = model.title;
    self.detailArr = model.detail;
    self.controllerArr = model.controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [RACObserve(delegate,networkStatus) subscribeNext:^(NSNumber * networkStatus) {
        NSLog(@"status ==>%@",networkStatus);
    }];
}

@end
