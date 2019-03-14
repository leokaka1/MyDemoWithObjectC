//
//  WaterFall.m
//  DemoPractice
//
//  Created by Leon on 2019/3/14.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "WaterFall.h"
#import "EWWaterFallLayout.h"

//随机色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@interface WaterFall ()<UICollectionViewDataSource,EWWaterFallLayoutDataSource>

@property (nonatomic,retain) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation WaterFall

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    EWWaterFallLayout *layout = [[EWWaterFallLayout alloc] init];
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}


- (CGFloat)waterFallLayout:(EWWaterFallLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth {
    if (indexPath == 1) {
        return itemWidth * 1;
    } else {
        return itemWidth * 1.5;
    }
}

- (NSUInteger)columnCountInWaterFallLayout:(EWWaterFallLayout *)waterFallLayout {
    return 2;
}

-(CGFloat)rowMarginInWaterFallLayout:(EWWaterFallLayout *)waterFallLayout{
    return 20;
}

- (CGFloat)columnMarginInWaterFallLayout:(EWWaterFallLayout *)waterFallLayout{
    return 30;
}

@end
