//
//  QuartzView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView


- (void)drawRect:(CGRect)rect {
    
//    添加直线
//    [self addLine];
    
//    添加曲线
//    [self addCurve];
    
//    画矩形
//    [self drawRect];
    
//    画椭圆
//    [self drawOral];
    
}


//-(void)pictureDown{
//    uiimag
//}

-(void)drawRect{
    CGContextRef ref = UIGraphicsGetCurrentContext();
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 100)];
//    圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:30];
    CGContextAddPath(ref, path.CGPath);
//    CGContextStrokePath(ref);
    [[UIColor redColor] set];
    CGContextFillPath(ref);
}

-(void)drawOral{
//    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 200)];
    [path stroke];
//    CGContextAddPath(ref, path.CGPath);
//    CGContextStrokePath(ref);
}


-(void)addCurve{
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 250)];
    [path addQuadCurveToPoint:CGPointMake(250, 250) controlPoint:CGPointMake(150, 50)];
//    [path addCurveToPoint:CGPointMake(60, 80) controlPoint1:CGPointMake(100, 110) controlPoint2:CGPointMake(200, 180)];
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);
    
}


-(void)addLine{
    //    获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //    描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //    画东西,起始点左上角为 0 0
    [path moveToPoint:CGPointMake(50, 50)];
    //    添加线
    [path addLineToPoint:CGPointMake(150, 150)];
    
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(100, 250)];
    
    //    设置线宽
    CGContextSetLineWidth(ref, 5);
    //    设置连接样式
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    //    设置顶角y样式
    CGContextSetLineCap(ref, kCGLineCapRound);
    //    设置颜色,使用set会自动匹配fill或者stroke
    [[UIColor redColor] set];
    
    // 3把路径添加到上下文,包装path
    CGContextAddPath(ref, path.CGPath);
    //    画板绘制内容渲染到View相关联的layer内容上
    //    stroke 描边
    //    fill 填充
    CGContextStrokePath(ref);
}


@end
