//
//  GestureLock.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "GestureLock.h"
#import "BgView.h"

@interface GestureLock ()

@property(strong,nonatomic) BgView *bgView;

@end

@implementation GestureLock

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bgView = [[BgView alloc]init];
    self.view = self.bgView;
}



@end
