//
//  XZ_RootTool.h
//  DemoPractice
//
//  Created by Leon on 2019/3/12.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZ_RootTool : NSObject

@property(strong,nonatomic) UIViewController *mainPageVc;
@property(strong,nonatomic) UIViewController *guideVc;

+(UIViewController *)chooseRootVC;

@end

NS_ASSUME_NONNULL_END
