//
//  CustomerButton.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CustomerButton.h"

@implementation CustomerButton

-(instancetype)initTitleTextButtonWithTitle:(NSString *)title TitleColor:(UIColor *)color Target:(id)target SEL:(SEL)selector{
    self = [super init];
    if (self != nil) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
