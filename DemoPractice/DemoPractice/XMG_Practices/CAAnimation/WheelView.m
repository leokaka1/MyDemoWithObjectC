//
//  WheelView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/11.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "WheelView.h"

@implementation WheelView


-(void)awakeFromNib{
    [super awakeFromNib];
    
    NSLog(@"%s",__func__);
}

+ (instancetype)wheelView{
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        NSLog(@"%s",__func__);
        self = [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil][0];
    }
    return self;
}



@end
