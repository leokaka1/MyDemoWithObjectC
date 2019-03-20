//
//  UIButton+customer.m
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "UIButton+customer.h"

@implementation UIButton (customer)

+(UIButton *)ButtonWithFrame : (CGRect)rect Title:(NSString *)title TitleColor:(UIColor *)color Target:(id)target SEL:(SEL)selector{
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton *)ButtonWithFrame: (CGRect)rect Title:(NSString *)title TitleFontSize:(CGFloat)fontSize TitleColor:(UIColor *)color BacgroundColor:(UIColor *)bacColor IsRoundCorner : (BOOL) isRound{
    
    UIButton *button = [[UIButton alloc]initWithFrame:rect];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    
    if (fontSize != 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }else{
        button.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    
    button.backgroundColor = bacColor;
    
//    if (bacColor != nil) {
    
//    }
//    
//    if (imageName != nil) {
//        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    }
    
    if (isRound) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:button.bounds   cornerRadius:button.bounds.size.width/2];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = bacColor.CGColor;
        layer.frame = button.bounds;
        layer.path = path.CGPath;
        button.layer.mask = layer;
    }
    
//    if (target != nil && selector != nil) {
//            [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    }
    
    return button;
}

@end
