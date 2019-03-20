//
//  PictureView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/9.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "PictureView.h"

@implementation PictureView

-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self != nil) {
    
//        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(update) userInfo:nil repeats:true];
        
//        caDisplayLink 定时器
//        一秒60次
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
    }
    return self;
}

static int _snowY = 0;
-(void)update{
    _snowY += 10;
    if (_snowY > kScreenHeight) {
        _snowY = 0;
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"personBg"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
}


@end
