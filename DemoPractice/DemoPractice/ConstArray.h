//
//  ConstArray.h
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConstArray : NSObject

@property(strong,nonatomic) NSArray *main_array;

-(NSArray *)getMainArray;

@end

NS_ASSUME_NONNULL_END
