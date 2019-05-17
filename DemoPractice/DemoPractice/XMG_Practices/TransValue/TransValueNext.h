//
//  TransValueNext.h
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol backDelegate <NSObject>

-(void)setBackValue:(NSString *)str;

@end


@interface TransValueNext : UIViewController

@property(copy,nonatomic) void(^backBlock)(NSString *str);
@property(weak,nonatomic) id<backDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
