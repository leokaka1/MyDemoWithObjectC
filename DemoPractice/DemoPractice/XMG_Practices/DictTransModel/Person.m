//
//  Person.m
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "Person.h"

@interface Person()
{
    NSString* _name;
    
//    BaseModel* _name2;
    NSString* _isName2;
    
    NSString* _isName3;
    NSString* name3;
    
    NSString* name4;
    NSString* isName4;
    
    NSString* isName5;
}

@end

@implementation Person

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self != nil) {
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

- (void)setName:(NSString*)name
{
    NSLog(@"%s name=%@", __FUNCTION__, name);
    _name = name;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%s value=%@, 该key=%@不存在！", __FUNCTION__, value, key);
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%s，该key不存在%@", __FUNCTION__, key);
    return nil;
}

@end
