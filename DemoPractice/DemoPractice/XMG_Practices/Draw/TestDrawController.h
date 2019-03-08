//
//  testDrawController.h
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "DrawController.h"
#import "DrawController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol testDelegate <NSObject>

-(void)openDraw;
-(void)backController;

@end

@interface TestDrawController : UIViewController

@property(nonatomic,strong) id<testDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
