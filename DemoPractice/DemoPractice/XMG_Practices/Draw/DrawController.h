//
//  Draw.h
//  DemoPractice
//
//  Created by Leon on 2019/3/8.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawController : UIViewController

@property(nonatomic,strong,readonly) UIView *sideView;
@property(nonatomic,strong,readonly) UIView *mainView;

-(void)close;
-(void)open;

@end

NS_ASSUME_NONNULL_END
