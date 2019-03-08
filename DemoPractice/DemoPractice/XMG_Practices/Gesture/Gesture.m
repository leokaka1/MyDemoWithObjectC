//
//  Gesture.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Gesture.h"
#import "RedView.h"

@interface Gesture ()<UIGestureRecognizerDelegate>

@property(strong,nonatomic) RedView *redView;
@property(strong,nonatomic) UIImageView *imageView;

@end

@implementation Gesture

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor whiteColor];
    _redView = [[RedView alloc]init];
    _redView.backgroundColor = [UIColor redColor];
    _redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:_redView];
    
//创建imageView
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personBg"]];
    self.imageView .frame = CGRectMake(100, 250, 150, 150);
    self.imageView.userInteractionEnabled = true;
    [self.view addSubview:self.imageView ];
    
    //    平移手势
    UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    panG.delegate = self;
    [self.imageView addGestureRecognizer:panG];
    
//    旋转手势
    UIRotationGestureRecognizer *rotateG = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateG:)];
    rotateG.delegate = self;
    [self.imageView addGestureRecognizer:rotateG];
    
//    缩放手势
    UIPinchGestureRecognizer *pinchG  = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchG:)];
    pinchG.delegate = self;
    [self.imageView addGestureRecognizer:pinchG];
    
}

//同时支持多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

//缩放
-(void)pinchG:(UIPinchGestureRecognizer*)pinchG{
    CGFloat scale = pinchG.scale;
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
    [pinchG setScale:1];
}

//旋转
-(void)rotateG:(UIRotationGestureRecognizer *)rotateG{
    CGFloat rotation = rotateG.rotation;
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation);
    [rotateG setRotation:0];
}

//平移手势
-(void)pan:(UIPanGestureRecognizer *)panG{
//    NSLog(@"%s",__func__);
    CGPoint p = [panG translationInView:self.imageView];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, p.x, p.y);
//    清零
    [panG setTranslation:CGPointZero inView:self.imageView];
}

@end
