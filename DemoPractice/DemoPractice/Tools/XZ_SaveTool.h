//
//  XZ_SaveTool.h
//  DemoPractice
//
//  Created by Leon on 2019/3/12.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZ_SaveTool : NSObject

+(void)setObject:(id)object forKey:(NSString *)key;

+(id)objectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END