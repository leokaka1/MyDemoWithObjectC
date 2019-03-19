//
//  DishModel.h
//  DemoPractice
//
//  Created by Leon on 2019/3/15.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StepModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DishModel : NSObject

@property(strong,nonatomic) NSString *ID;
@property(strong,nonatomic) NSString *title;
@property(strong,nonatomic) NSString *tags;
@property(strong,nonatomic) NSString *imtro;
@property(strong,nonatomic) NSString *ingredients;
@property(strong,nonatomic) NSString *burden;
@property(strong,nonatomic) NSArray *albums;
@property(strong,nonatomic) NSArray *steps;

@end

NS_ASSUME_NONNULL_END
