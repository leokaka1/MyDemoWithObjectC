//
//  PersonModel.h
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *age;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)personWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
