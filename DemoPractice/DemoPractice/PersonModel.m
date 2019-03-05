//
//  PersonModel.m
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)personWithDict:(NSDictionary *)dict{
    PersonModel *model = [[self alloc]initWithDict:dict];
    return model;
}

@end
