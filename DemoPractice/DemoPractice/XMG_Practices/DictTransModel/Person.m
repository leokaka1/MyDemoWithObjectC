//
//  Person.m
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.name  = dict[@"name"];
        self.age = dict[@"age"];
        NSArray *tempDogArr = dict[@"dog"];
        
        self.dogArr = [NSMutableArray array];
        for (NSDictionary *dict in tempDogArr) {
            Dog *dog = [[Dog alloc]initWithDict:dict];
            [self.dogArr addObject:dog];
        }
    }
    return self;
}

@end
