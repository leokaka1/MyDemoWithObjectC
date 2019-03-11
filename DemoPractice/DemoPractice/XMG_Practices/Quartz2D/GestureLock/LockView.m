//
//  LockView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "LockView.h"

@implementation LockView

//gesture_node_highlighted,gesture_node_normal Home_refresh_bg
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

-(void)setup{
    
    self.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i < 9; i++) {
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:button];
    }
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    int count =3;
    CGFloat margin = 10;
    CGFloat buttonW = (self.bounds.size.width - 4 *margin) / 3;
    CGFloat buttonH = (self.bounds.size.height - 4 *margin) / 3;
    for (int i = 0; i < self.subviews.count;  i ++) {
        CGFloat column = i % count;
        CGFloat row = i / count;
        CGFloat buttonX = (margin + buttonW ) * column;
        CGFloat buttonY = (margin + buttonH ) * row;
        
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    
    
}

- (void)drawRect:(CGRect)rect {
    
}


@end
