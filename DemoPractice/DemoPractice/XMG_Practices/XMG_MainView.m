//
//  XMG_MainView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XMG_MainView.h"
#import "TransValue.h"
#import "Sandbox.h"
#import "NaviDemo.h"
#import "Transform.h"
#import "Gesture.h"
#import "ShoppingCart.h"

@interface XMG_MainView ()


@end

@implementation XMG_MainView

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    MainPageModel *model = [[MainPageModel alloc]initWithDict:[ConstDictionary getXMGMainDictionary]];
    self.titleArr = model.title;
    self.detailArr = model.detail;
    self.controllerArr = model.controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小马哥练习";
}



@end
