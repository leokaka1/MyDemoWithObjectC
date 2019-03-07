//
//  Person.h
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(copy,nonatomic) NSString *name;
@property(assign,nonatomic) NSString *age;
@property(strong,nonatomic) Cat *cat;
@property(strong,nonatomic) NSMutableArray *dogArr;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
