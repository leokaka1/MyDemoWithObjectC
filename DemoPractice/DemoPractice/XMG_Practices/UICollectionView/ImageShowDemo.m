//
//  ImageShowDemo.m
//  DemoPractice
//
//  Created by Leon on 2019/3/14.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "ImageShowDemo.h"
#import "ImageLayout.h"
#import "CollectionImageCell.h"
#import "WaterFall.h"

static NSString *identifier = @"cellId";

@interface ImageShowDemo ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic) NSMutableArray *imageDataArr;


@end

@implementation ImageShowDemo


- (void)viewDidLoad {
    
    kSaveUserDefault(@"123", @"name");
    NSLog(@"name = >%@",kLoadUserDefault(@"name"));
   
    
    [super viewDidLoad];
    _imageDataArr = [NSMutableArray array];
    for (int i = 0 ; i<5; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [self.imageDataArr addObject:image];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    ImageLayout *imageLayout  = ({
        ImageLayout *imageLayout= [[ImageLayout alloc]init];
        imageLayout.minimumInteritemSpacing = 50;
        imageLayout.itemSize = CGSizeMake(200, 200);
//        imageLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        imageLayout;
    });
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,100, kScreenWidth, 300) collectionViewLayout:imageLayout];
        collectionView.backgroundColor = [UIColor greenColor];
        [collectionView registerNib:[UINib nibWithNibName:@"CollectionImageCell" bundle:nil] forCellWithReuseIdentifier:identifier];
        collectionView.delegate =self;
        collectionView.dataSource = self;
        collectionView;
    });
    
    UIButton *waterFallButton = [[UIButton alloc]init];
    waterFallButton.frame= CGRectMake(20, 500, 100, 30);
    [waterFallButton setTitle:@"瀑布流" forState:UIControlStateNormal];
    [waterFallButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [waterFallButton addTarget:self action:@selector(jumpToWaterFall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:waterFallButton];
    [self.view addSubview:collectionView];
}

-(void)jumpToWaterFall{
    WaterFall *waterfall = [[WaterFall alloc]init];
    [self.navigationController pushViewController:waterfall animated:true];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.cellImageView.image  = self.imageDataArr[indexPath.row];
    return cell;
}
@end
