
//
//  RedView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RedView.h"

@implementation RedView

//触摸时自动调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    NSLog(@"%s",__func__);
}

//    当触摸移动时调用
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%s",__func__);
    
    UITouch *touch  =  [touches anyObject];
    
//    获取上一个点
    CGPoint preP =  [touch previousLocationInView:self];
//    获取当前点
    CGPoint curP = [touch locationInView:self];
    
//    计算偏移的值
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    
//    NSLog(@"preP == > %@, curP == > %@",NSStringFromCGPoint(preP) , NSStringFromCGPoint(curP));
    
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
}

//手指离开时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}



@end
