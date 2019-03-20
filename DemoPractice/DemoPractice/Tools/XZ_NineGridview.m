//
//  XZ_NineGridview.m
//  DemoPractice
//
//  Created by Leon on 2019/3/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XZ_NineGridview.h"

@interface XZ_NineGridview()



@end

@implementation XZ_NineGridview

-(NSArray *)widgetArr{
    if (_widgetArr == nil) {
        _widgetArr = [NSArray array];
    }
    return _widgetArr;
}

/**
 @property(assign,nonatomic)  int count;
 @property(assign,nonatomic)  int margin;
 @property(assign,nonatomic)  int itemWidth;
 @property(assign,nonatomic)  int itemHeight;
 @property(strong,nonatomic)  NSArray *widgetArr;
 */
-(instancetype)initWithFrame:(CGRect)frame Count : (int)count Margin : (int) margin ItemHeight:(CGFloat)itemHieght ItemColor:(UIColor *)itemColor WidgetArr :(NSArray *)widgetArr{
    if (self = [super initWithFrame:frame]) {
        self.count = count;
        self.margin = margin;
        self.itemHeight = itemHieght;
        self.widgetArr = widgetArr;
        self.itemColor = itemColor;
        [self setup];
    }
    return self;
}

-(void)setup{
    int count = self.count;
    CGFloat margin = self.margin;
    CGFloat width = (self.bounds.size.width-(self.count+1)*margin) / self.count;
    CGFloat height = self.itemHeight;
    NSLog(@"count =>%ld",self.widgetArr.count);
    for (int i = 0; i<self.widgetArr.count; i++) {
        int row = i % count;
        int col = i / count;
        id widget = self.widgetArr[i];
        if ([[widget class] isMemberOfClass:[UIView class]]) {
            UIView *view = (UIView *)widget;
            view.backgroundColor = self.itemColor;
            view.frame = CGRectMake(margin + row * (width + margin), margin + col * (height + margin), width, height);
            [self addSubview:widget];
        }else if ([[widget class] isMemberOfClass:[UIView class]]){
            UIButton *btn = (UIButton *)widget;
            btn.frame = CGRectMake(margin + row * (width + margin), margin + col * (height + margin), width, height);
            [self addSubview:widget];
        }else{
            NSString *title = (NSString *)widget;
            UIButton *contentBtn = [[UIButton alloc]init];
            contentBtn.frame = CGRectMake(margin + row * (width + margin), margin + col * (height + margin), width, height);
            contentBtn.backgroundColor = self.itemColor;
            if (self.itemColor  == Color_White) {
                [contentBtn setTitleColor:Color_Black forState:UIControlStateNormal];
            }else{
                [contentBtn setTitleColor:Color_White forState:UIControlStateNormal];
            }
            contentBtn.tag = i;
            [contentBtn setTitle:title forState:UIControlStateNormal];
            [contentBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:contentBtn];
        }
    }
}

-(void)clickBtn:(UIButton *)btn{
    [self.delegate didSelectGridViewForIndex:btn.tag];
}

@end
