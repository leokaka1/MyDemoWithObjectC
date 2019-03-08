//
//  Quartz2D.m
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Quartz2D.h"
#import "QuartzView.h"

@interface Quartz2D ()

@property(strong,nonatomic) QuartzView *Quarz_view;

@end

@implementation Quartz2D

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _Quarz_view = [[QuartzView alloc]initWithFrame:CGRectMake(45, 100, 300, 300)];
    _Quarz_view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_Quarz_view];
    
}



@end
