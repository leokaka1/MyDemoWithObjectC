//
//  MainPageModel.m
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "MainPageModel.h"

@implementation MainPageModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self != nil) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


@end
