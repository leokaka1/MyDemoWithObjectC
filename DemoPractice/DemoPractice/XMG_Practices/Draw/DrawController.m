//
//  Draw.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "DrawController.h"

//设置目标固定值
#define target 300

@interface DrawController ()



@end

@implementation DrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
//    添加第一层view
    _sideView = [[UIView alloc]initWithFrame:self.view.bounds];
    _sideView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_sideView];
    
//    添加第二层View
    _mainView = [[UIView alloc]initWithFrame:self.view.bounds];
    _mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_mainView];
    

    
//    添加平移手势
    UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panG:)];
    [_mainView addGestureRecognizer:panG];
    
//    设置点按手势
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
    [_sideView addGestureRecognizer:tapG];
}



-(void)panG:(UIPanGestureRecognizer *)panG{
    
//    获取
    CGPoint p = [panG translationInView:self.mainView];
    [self positionWithOffset:p.x];
    
//    判断手势状态
    if (panG.state == UIGestureRecognizerStateEnded) {
//        如果当前x值大于屏幕则自动到右侧
        if (self.mainView.frame.origin.x  > kScreenWidth / 2) {
            CGFloat offsetX = target - self.mainView.frame.origin.x;
            [UIView animateWithDuration:0.25 animations:^{
                [self positionWithOffset:offsetX];
            }];
        }else{
            [UIView animateWithDuration:0.25 animations:^{
                [self close];
            }];
        }
    }
    
//    清零
    [panG setTranslation:CGPointZero inView:self.mainView];
}

-(void)positionWithOffset:(CGFloat)offset{
    //    获取frame
    CGRect frame  = self.mainView.frame;
    frame.origin.x += offset;
    self.mainView.frame = frame;
    
    if (self.mainView.frame.origin.x <= 0 ) {
        self.mainView.frame = self.view.bounds;
    }
    
//    设置一个固定值，当当前偏移量大于此值就无法拖动
    if (self.mainView.frame.origin.x > target) {
        CGRect frame  = self.mainView.frame;
        frame.origin.x = target;
        self.mainView.frame = frame;
    }
    
//    设置缩小比例
    CGFloat scale = self.mainView.frame.origin.x *0.3 / kScreenWidth;
    scale = 1-scale;
    
    self.mainView.transform = CGAffineTransformMakeScale(scale, scale);
}



//关闭抽屉
-(void)close{
    [UIView animateWithDuration:0.25 animations:^{
        //    清空形变
        self.mainView.transform = CGAffineTransformIdentity;
        //    复位
        self.mainView.frame = self.view.bounds;
    }];
}

-(void)open{
    [UIView animateWithDuration:0.25 animations:^{
        [self positionWithOffset:target];
        CGRect frame  = self.mainView.frame;
        frame.origin.x = target;
        self.mainView.frame = frame;
    }];
    
}




@end
