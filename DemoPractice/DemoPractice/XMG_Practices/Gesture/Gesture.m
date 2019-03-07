//
//  Gesture.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Gesture.h"
#import "RedView.h"

@interface Gesture ()

@property(strong,nonatomic) RedView *redView;

@end

@implementation Gesture

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor whiteColor];
    _redView = [[RedView alloc]init];
    _redView.backgroundColor = [UIColor redColor];
    _redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:_redView];
    
}

@end
