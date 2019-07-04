//
//  SmallPieceController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "SmallPieceController.h"

@interface SmallPieceController ()<GridViewDelegate>

@property(strong,nonatomic) NSArray *titleArr;

@end

@implementation SmallPieceController

-(NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"排序算法",@"扫码",@"不同Cell展示",@"滑动选项",@"文字轮播图",@"文字轮播图",@"文字轮播图",@"文字轮播图",@"文字轮播图"];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小功能简介";
    [self setup];
}

-(void)setup{
    self.view.backgroundColor = Color_White;
    UIView *bacView = [[UIView alloc]initWithFrame:CGRectMake(20, 100, kScreenWidth-40, 300)];
    bacView.backgroundColor = Color_Gray_Light;
    [self.view addSubview:bacView];
    
    
    CGFloat itemHeight = (bacView.height - 4) / 3 ;
    XZ_NineGridview *gridView =[[XZ_NineGridview alloc]initWithFrame:bacView.bounds Count:3 Margin:1  ItemHeight:itemHeight ItemColor:Color_White WidgetArr:self.titleArr];
    gridView.delegate = self;
    [bacView addSubview:gridView];
}

-(void)didSelectGridViewForIndex:(NSInteger)index{
    
    NSString *destinationController = @"";
    switch (index) {
        case 0:
            destinationController = @"Sort";
            break;
        case 2:
            destinationController = @"DifCell";
            break;
            
        default:
            break;
    }
    
    Class class = NSClassFromString(destinationController);
    UIViewController *vc  = [[class alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}
@end
