//
//  Person.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Person.h"

@interface Person()

@property(nonatomic,strong) NSString *name;

@end

@implementation Person

+(instancetype)shareManager{
    static Person *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

@end
