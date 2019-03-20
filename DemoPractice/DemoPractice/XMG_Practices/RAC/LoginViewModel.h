//
//  LoginViewModel.h
//  DemoPractice
//
//  Created by Leon on 2019/3/19.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property(strong,nonatomic) NSString *phoneStr;
@property(strong,nonatomic) NSString *psdStr;
@property(strong,nonatomic) RACCommand *loginCommand;
@property(strong,nonatomic) RACSignal *btnEnableSignal;


@end

NS_ASSUME_NONNULL_END
