//
//  MainPage+OtherFunction.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "MainPage+OtherFunction.h"

@implementation MainPage (OtherFunction)

static MainPage *manager = nil;
+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    
    return manager;
}

+(void)hello{
    NSLog(@"123");
}

@end
