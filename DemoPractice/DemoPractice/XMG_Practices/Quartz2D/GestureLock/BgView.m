//
//  BgView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "BgView.h"
#import "LockView.h"

@implementation BgView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        LockView *lockView = [[LockView alloc]init];
        lockView.frame = CGRectMake(20, 100, kScreenWidth - 40, 300);
        [self addSubview:lockView];
    }
    
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *bgImage = [UIImage imageNamed:@"Home_refresh_bg"];
    [bgImage drawInRect:rect];
}


@end
