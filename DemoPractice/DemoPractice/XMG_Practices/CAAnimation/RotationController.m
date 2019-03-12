
//
//  RotationController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/11.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RotationController.h"
#import "WheelView.h"

@interface RotationController ()

@property(strong,nonatomic) WheelView *wheelView;

@end

@implementation RotationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    WheelView *wheelView = [WheelView wheelView];
    WheelView *wheelView = [[WheelView alloc]init];
    wheelView.center = self.view.center;
    self.wheelView = wheelView;
    [self.view addSubview:wheelView];
}



- (IBAction)startRotate:(UIButton *)sender {
    [self.wheelView startRotation];
}

- (IBAction)stopRotate:(UIButton *)sender {
    [self.wheelView stopRotation];
}




@end
