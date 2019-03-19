//
//  TestRACView.h
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestRACView : UIView

-(instancetype)initWithBgColor:(UIColor *)color Frame : (CGRect )rect;

@property(strong,nonatomic) RACSubject  *subject;

-(void)sendValue:(NSString *)str andDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
