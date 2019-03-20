//
//  XZ_NineGridview.h
//  DemoPractice
//
//  Created by Leon on 2019/3/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GridViewDelegate <NSObject>

-(void)didSelectGridViewForIndex:(NSInteger)index;

@end

@interface XZ_NineGridview : UIView

@property(assign,nonatomic)  int count;
@property(assign,nonatomic)  int margin;
@property(strong,nonatomic)   UIColor *itemColor;
@property(assign,nonatomic)  CGFloat itemHeight;
@property(strong,nonatomic)  NSArray *widgetArr;
@property(strong,nonatomic) id<GridViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame Count : (int)count Margin : (int) margin ItemHeight:(CGFloat)itemHieght ItemColor:(UIColor *)itemColor WidgetArr :(NSArray *)widgetArr;

@end

NS_ASSUME_NONNULL_END
