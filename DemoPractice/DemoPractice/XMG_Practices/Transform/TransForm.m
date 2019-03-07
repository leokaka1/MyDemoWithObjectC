//
//  TransForm.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TransForm.h"

@interface TransForm ()

@property(strong,nonatomic) UIView *redView;
@property(strong,nonatomic) UIImageView *imageView;
@property(assign,nonatomic) BOOL isUp;

@end

@implementation TransForm

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor= [UIColor whiteColor];
    
    _redView = [[UIView alloc]init];
    _redView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 100);
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, kScreenWidth - 200, 150)];
    _imageView.image = [UIImage imageNamed:@"personBg"];
    [self.view addSubview:_imageView];
    
    _isUp = true;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//        平移
//    _redView.transform = CGAffineTransformMakeTranslation(0, 300);
//    如果需要动画
    if (_isUp) {
        [UIView animateWithDuration:0.5 animations:^{
            self.redView.transform = CGAffineTransformMakeTranslation(0, -100);
        }];
        _isUp = false;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            //            不带make只做一次形变，带make的相对上一次的操作
//            self.redView.transform = CGAffineTransformMakeTranslation(0, 0);
            self.redView.transform = CGAffineTransformTranslate(self.redView.transform, 0,100);
        }];
        _isUp = true;
    }
    
    
//    旋转
//    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
//    }];
    
//    缩放
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.5, 1.5);
    }];
    
}



@end
