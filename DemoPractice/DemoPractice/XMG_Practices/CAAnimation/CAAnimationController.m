//
//  CAAnimation.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CAAnimationController.h"

@interface CAAnimationController ()

@property(strong,nonatomic) UIView *redView;

@end

@implementation CAAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];

    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    CATransition *trans = [CATransition animation];
//    trans.type = kCATransitionMoveIn;
//    trans.subtype = kCATransitionFromTop
//    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
//    basicAnimation.keyPath = @"position.y";
//    basicAnimation.toValue = @(400);
////    不要删除状态
//    basicAnimation.removedOnCompletion = false;
////    c保持最后的状态
//    basicAnimation.fillMode = kCAFillModeForwards;
    
//    [self.redView.layer addAnimation:basicAnimation forKey:@"anim1"];
    
// 组动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @(300);
//    animation.duration = 0.4;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:animation forKey:@"animation"];
    
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath = @"transform.scale";
    animation1.toValue = @0.5;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1];
    group.fillMode = kCAFillModeForwards;
    group.duration = 0.4;
    group.removedOnCompletion = false;
    [self.redView.layer addAnimation:group forKey:@"animation"];
    
}


@end
