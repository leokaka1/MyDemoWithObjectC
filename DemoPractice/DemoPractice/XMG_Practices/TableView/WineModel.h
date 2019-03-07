//
//  WineModel.h
//  DemoPractice
//
//  Created by 曹笑竹 on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WineModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) NSString *no;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)wineWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
