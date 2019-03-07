//
//  MainPageModel.h
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageModel : NSObject

@property(strong,nonatomic)  NSArray *title;
@property(strong,nonatomic)  NSArray *detail;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
