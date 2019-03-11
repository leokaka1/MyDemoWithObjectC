//
//  Quartz2D.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Quartz2D.h"
#import "QuartzView.h"
#import "PictureView.h"
#import "DrawPictureAndText.h"
#import "GestureLock.h"

@interface Quartz2D ()

@property(strong,nonatomic) QuartzView *Quarz_view;
@property(strong,nonatomic) PictureView *pictureView;

@end

@implementation Quartz2D

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _Quarz_view = [[QuartzView alloc]initWithFrame:CGRectMake(45, 100, 300, 300)];
    _Quarz_view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_Quarz_view];
    
    CustomerButton *jumpButton = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"跳转" TitleColor:[UIColor blackColor] Target:self SEL:@selector(clickToJump)];
    
    jumpButton.frame = CGRectMake(45, 500, 100, 50);
    [jumpButton sizeToFit];
    [self.view addSubview:jumpButton];
    
    CustomerButton *jumpButton1 = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"手势解锁" TitleColor:[UIColor blackColor] Target:self SEL:@selector(clickToJump1)];
    
    jumpButton1.frame = CGRectMake(200, 500, 100, 50);
    [jumpButton1 sizeToFit];
    [self.view addSubview:jumpButton1];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_Quarz_view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer   *mainlayer = [[CAShapeLayer alloc]init];
    mainlayer.frame  = _Quarz_view.bounds;
    mainlayer.path = path.CGPath;
    _Quarz_view.layer.mask = mainlayer;
    
    
//    _pictureView = [[PictureView alloc]init];
//    _pictureView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    [self.view addSubview:_pictureView];
    
}

-(void)clickToJump{
    DrawPictureAndText *text = [DrawPictureAndText new];
    [self.navigationController pushViewController:text animated:true];
}


-(void)clickToJump1{
    GestureLock *gestureLock = [GestureLock new];
    [self.navigationController pushViewController:gestureLock animated:true];
}


@end
