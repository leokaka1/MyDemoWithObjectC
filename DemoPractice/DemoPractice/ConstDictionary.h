//
//  ConstDictionary.h
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConstDictionary : NSObject

@property(strong,nonatomic) NSDictionary *mainDict;

-(NSDictionary *)getMainDictionary;

@end

NS_ASSUME_NONNULL_END
