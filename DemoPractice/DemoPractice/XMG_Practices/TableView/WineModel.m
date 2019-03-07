//
//  WineModel.m
//  DemoPractice
//
//  Created by 曹笑竹 on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype)wineWithDict:(NSDictionary *)dict{
    WineModel *model = [[self alloc]initWithDict:dict];
    return model;
}

@end
