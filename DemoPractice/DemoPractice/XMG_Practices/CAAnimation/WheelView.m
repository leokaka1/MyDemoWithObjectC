//
//  WheelView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/11.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "WheelView.h"
#import "CustomButton.h"

@interface WheelView()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property(strong,nonatomic) CADisplayLink *link;

@property(weak,nonatomic) UIButton * preBtn;

@end

@implementation WheelView

-(CADisplayLink *)link{
    if (_link == nil) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
        
    }
    return _link;
}

-(void)awakeFromNib{
    [super awakeFromNib];
//    开启交互
    self.bgView.userInteractionEnabled = true;
    [self setButton];
}

+ (instancetype)wheelView{
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        NSLog(@"%s",__func__);
        self = [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
    }
    return self;
}

-(void)setButton{
    CGFloat angle = 0;
    
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *oriHighLightImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat x= 0;
    CGFloat y = 0;
//    像素应该x2
    CGFloat w= oriImage.size.width / 12 * [UIScreen mainScreen].scale;
    CGFloat h = oriImage.size.height *[UIScreen mainScreen].scale;
    
    for (int i = 0; i<12; i++) {
        UIButton *button  = [[CustomButton alloc]init];
//        if (i %2 == 0) {
//            button.backgroundColor = [UIColor redColor];
//        }else{
//            button.backgroundColor = [UIColor blueColor];
//        }
        
//        裁剪新图片
        x = i *w;
       CGRect rect = CGRectMake(x, y, w, h);
       CGImageRef ref =   CGImageCreateWithImageInRect(oriImage.CGImage, rect);
        CGImageRef refHighLight = CGImageCreateWithImageInRect(oriHighLightImage.CGImage, rect);
//        设置按钮图片
        [button setImage:[UIImage imageWithCGImage:ref] forState:UIControlStateNormal];
        [button setImage:[UIImage imageWithCGImage:refHighLight] forState:UIControlStateSelected];

        button.bounds = CGRectMake(0, 0, 68, 143);
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        button.layer.position = CGPointMake(self.bgView.bounds.size.width / 2, self.bgView.bounds.size.height / 2);
//        旋转角度
        button.transform = CGAffineTransformMakeRotation(angle * M_PI / 180);
        angle += 30;
        
        //        设置按钮图片
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self btnClick:button];
        }
        
        [self.bgView addSubview:button];
    }
}

-(void)btnClick:(UIButton *)btn{
    self.preBtn.selected = false;
    btn.selected = true;
    self.preBtn = btn;
}

-(void)startRotation{

//    核心动画不能实现人机交互
    [self.link setPaused:false];
    
//    改用UIView动画
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (IBAction)startChoose:(UIButton *)sender {
//    快速选号
        CABasicAnimation *basicAnimation = [CABasicAnimation animation];
        basicAnimation.keyPath  = @"transform.rotation";
        basicAnimation.toValue = @(M_PI *4);
        basicAnimation.repeatCount = 1;
        basicAnimation.duration = 1;
        basicAnimation.delegate =self;
        [self.bgView.layer addAnimation:basicAnimation forKey:@"animation1"];
    
//    动画停止时按钮指向最上方
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束");
    
//    获取当前按钮旋转的弧度
    CGAffineTransform tras = self.preBtn.transform;
//    获取弧度
    CGFloat angle= atan2(tras.b, tras.a);
//    让按钮倒着回旋回去
    self.bgView.transform = CGAffineTransformMakeRotation(-angle);
    
    [self.link setPaused:true];
}

//更新View的角度
-(void)rotate{
//    旋转转盘
    self.bgView.transform = CGAffineTransformRotate(self.bgView.transform, M_PI / 300);
}

-(void)stopRotation{
    [self.link setPaused:true];
}

@end
