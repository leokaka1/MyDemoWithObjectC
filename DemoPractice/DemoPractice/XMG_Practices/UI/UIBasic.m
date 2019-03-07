//
//  UIBasic.m
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "UIBasic.h"


@interface UIBasic ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *mainScrollView;
@property(strong,nonatomic) NSTimer *timer;
@property(assign,nonatomic) int count;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(strong,nonatomic) UIView *redView;

@end

@implementation UIBasic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


-(void)setupUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    广告滚动视图
//    [self setScrollView];
    
//    autoResizing
    [self setAutoResizing];
    
}

#pragma mark - 设置布局
-(void)setAutoResizing{
    
    _redView = [[UIView alloc]init];
//    redView.frame = CGRectMake(kScreenWidth - 100, kScreenHeight - 100,100 , 100);
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
//    autoResizing
//    redView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
//    Mansory
    [_redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

//    禁用autoResizing转为对应的约束
//    _redView.translatesAutoresizingMaskIntoConstraints = NO;
    
//    添加约束
//    宽度约束
//    NSLayoutConstraint *wlc =   [NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
//    [_redView addConstraint:wlc];
//
////    高度约束
//    NSLayoutConstraint *hlc =   [NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
//    [_redView addConstraint:hlc];
//
////    右约束
//    NSLayoutConstraint *right_lc =   [NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
//    [self.view addConstraint:right_lc];
//
//    //    下约束
//    NSLayoutConstraint *bottom_lc =   [NSLayoutConstraint constraintWithItem:_redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
//    [self.view addConstraint:bottom_lc];
}

#pragma mark - ScrollView滚动广告视图
-(void)setScrollView{
    
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 150)];
    _mainScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_mainScrollView];

    for (int i = 0 ; i<5; i++) {
        UIImageView *scrollImag = [[UIImageView alloc]initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, 150)];
        scrollImag.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_0%d",i+1]];
        [_mainScrollView addSubview:scrollImag];
    }
    
    _mainScrollView.contentSize = CGSizeMake(5* kScreenWidth, 0);
    _mainScrollView.showsHorizontalScrollIndicator = false;
    _mainScrollView.pagingEnabled = true;
    _mainScrollView.bounces = false;
    _mainScrollView.delegate =self;
    
//    设置pageindex
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 184, kScreenWidth, 30)];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.pageIndicatorTintColor = [UIColor blueColor];
    [self.view addSubview:_pageControl];
    
//    添加定时器
    self.count = 0;
    [self addTimer];
}

//添加定时器
-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:true];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

//下一页计算
-(void)next{
    self.count++;
    if (_count > 4) {
        _count = 0;
    }
    
    _pageControl.currentPage = self.count;
//    无动画
//    _mainScrollView.contentOffset = CGPointMake(self.count * kScreenWidth, 0);
//    有动画
    [_mainScrollView setContentOffset:CGPointMake(self.count * kScreenWidth, 0) animated:true];
}

// 如果开始拉动，则定时器失效
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
}

//停止滚动时开始加载定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

// scrollview滚动的时候调用,计算pageControl
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.pageControl.currentPage = page;
}

@end
