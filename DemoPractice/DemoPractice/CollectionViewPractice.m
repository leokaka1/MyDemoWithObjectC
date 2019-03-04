//
//  CollectionViewPractice.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CollectionViewPractice.h"

static NSString *identifier = @"cellid";

@interface CollectionViewPractice ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(strong,nonatomic) UICollectionView  *mainCollectionView;
@property(strong,nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation CollectionViewPractice

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"你好" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button sizeToFit];
    button.imageView.aliCornerRadius = 3.0;
    [self.view addSubview:button];
    
//    [self setupUI];
}


-(void)setupUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat margin = 10;
    
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _flowLayout.minimumLineSpacing = 10;
    _flowLayout.minimumInteritemSpacing =10;
    _flowLayout.itemSize = CGSizeMake((kScreenWidth - 3*margin) / 2, 200);
    
    
    _mainCollectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:_flowLayout];
    _mainCollectionView.backgroundColor = [UIColor whiteColor];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [_mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_mainCollectionView];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",(long)indexPath.row);
    
}

@end
