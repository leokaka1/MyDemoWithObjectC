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

static NSString *identifier = @"cell";

@interface MainPage ()




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
}

@end
