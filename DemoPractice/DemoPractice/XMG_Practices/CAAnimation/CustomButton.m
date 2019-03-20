//
//  CustomButton.m
//  DemoPractice
//
//  Created by Leon on 2019/3/11.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    只能一个区域点击
    CGRect rect =  CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height / 2);
    //判断点在不在区域
    if (CGRectContainsPoint(rect, point)) {
        return [super hitTest:point withEvent:event];
    }else{
            //    否则不能点击
        return nil;
    }
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

//返回按钮内部的imageView的尺寸位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat w = 40;
    CGFloat h = 45;
    CGFloat x = (contentRect.size.width - w) / 2;
    CGFloat y = 20;
    
    return CGRectMake(x, y, w, h);
}

@end
