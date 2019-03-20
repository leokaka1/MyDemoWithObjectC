//
//  CAAnimation.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CAAnimationController.h"
#import "RotationController.h"

@interface CAAnimationController ()

@property(strong,nonatomic) UIView *redView;
@property(strong,nonatomic) UIImageView *pictureImageView;

@end

@implementation CAAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _redView.layer.anchorPoint  = CGPointMake(0, 0);
    _redView.layer.position = CGPointMake(0, 64);
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    _pictureImageView = [[UIImageView alloc]init];
    _pictureImageView.frame = CGRectMake(0, 0, 300, 300);
    _pictureImageView.center = self.view.center;
    _pictureImageView.image = [UIImage imageNamed:@"0"];
//    只显示图片的一半
    _pictureImageView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    [self.view addSubview:_pictureImageView];
    
    
    UIButton *jumpButton = [[UIButton alloc]init];
    jumpButton.frame = CGRectMake(100, 500, 100, 40);
    [jumpButton setTitle:@"跳转去转盘" forState:UIControlStateNormal];
    [jumpButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [jumpButton addTarget:self action:@selector(jumpToRotate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpButton];
}

-(void)jumpToRotate{
//    RotationController *rotate = [[RotationController alloc]init];
//    [self.navigationController pushViewController:rotate animated:true];
    UIStoryboard *sb  = [UIStoryboard storyboardWithName:@"Rotation" bundle:nil];
    RotationController *rotate =  [sb instantiateViewControllerWithIdentifier: @"rotate"];
    [self.navigationController pushViewController:rotate animated:true];
}

static int _count = 0;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _count++;
    if (_count > 4) {
        _count = 0;
    }
    self.pictureImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",_count]];
    
    CATransition *trans = [CATransition animation];
    trans.type = @"fade";
    trans.duration = 1.0;
    [self.pictureImageView.layer addAnimation:trans forKey:kCATransition];
    NSLog(@"123");
    
}

-(void)singleAnimation{
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
}

-(void)groupAnimation{
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
