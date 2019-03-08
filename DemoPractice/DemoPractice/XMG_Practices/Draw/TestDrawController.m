//
//  testDrawController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TestDrawController.h"

@interface TestDrawController ()

@end

@implementation TestDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        UIButton *button = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"返回" TitleColor:[UIColor blueColor] Target:self SEL:@selector(clickBack)];
        button.frame = CGRectMake(100, 100, 100, 30);
        [self.view addSubview:button];
    
        UIButton *button1 = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"打开" TitleColor:[UIColor blueColor] Target:self SEL:@selector(open)];
        button1.frame = CGRectMake(100, 200, 100, 30);
        [self.view addSubview:button1];
}

-(void)open{
    [self.delegate openDraw];
}

-(void)clickBack{
    [self.delegate backController];
}

@end
