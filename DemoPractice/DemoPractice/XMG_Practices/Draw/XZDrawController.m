//
//  XZDrawController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XZDrawController.h"
#import "TestDrawController.h"

@interface XZDrawController ()<testDelegate>

@end

@implementation XZDrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestDrawController *test = [[TestDrawController alloc]init];
    test.delegate = self;
    test.view.frame = self.view.bounds;
    [self.mainView addSubview:test.view];
    [self addChildViewController:test];
}

-(void)openDraw{
    [self open];
}

-(void)backController{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
