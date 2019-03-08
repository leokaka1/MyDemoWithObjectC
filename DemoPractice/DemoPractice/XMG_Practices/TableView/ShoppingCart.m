//
//  ShoppingCart.m
//  DemoPractice
//
//  Created by 曹笑竹 on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "ShoppingCart.h"
#import "CartCell.h"
//static NSString *identifier = @"cell_ID";
@interface ShoppingCart ()<UITableViewDelegate,UITableViewDataSource,cellDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UILabel *itemCountLabel;
@property(nonatomic,strong) UILabel *totalPriceLabel;
@property(nonatomic,strong) UIButton *payBtn;
@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) NSArray *finalDataArr;
@property(strong,nonatomic) NSMutableArray *tempArr;
@property(nonatomic,assign) int sumPrice;

@end

@implementation ShoppingCart

-(NSArray *)finalDataArr{
    if (_finalDataArr == nil) {
        _finalDataArr = [NSArray array];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in self.dataArr) {
            WineModel *model = [WineModel wineWithDict:dict];
            [tempArr addObject:model];
        }
        _finalDataArr = tempArr;
    }
    return _finalDataArr;
}

-(void)setDataSource{
    self.dataArr = @[
                     @{@"no":@"1",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
  
                     @{@"no":@"2",@"name" : @"红酒",@"price":@"1000",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552572349&di=0829b09fcec69494e0d70ddabb6264a6&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5ab5c9ea15ce36d3a940651430f33a87e950b14a.jpg"},
  
                     @{@"no":@"3",@"name":@"白葡萄酒",@"price" :@"50",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977730570&di=c4be060cd1d9d37d71b342d56165a8c2&imgtype=0&src=http%3A%2F%2Fimg4.99114.com%2Fgroup1%2FM00%2F1E%2FAE%2FwKgGTFXJ07KANWvaAAGRCVKe4mk653.jpg"},
                     
                     @{@"no":@"4",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"5",@"name" : @"红酒",@"price":@"1000",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552572349&di=0829b09fcec69494e0d70ddabb6264a6&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5ab5c9ea15ce36d3a940651430f33a87e950b14a.jpg"},
                     
                     @{@"no":@"6",@"name":@"白葡萄酒",@"price" :@"50",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977730570&di=c4be060cd1d9d37d71b342d56165a8c2&imgtype=0&src=http%3A%2F%2Fimg4.99114.com%2Fgroup1%2FM00%2F1E%2FAE%2FwKgGTFXJ07KANWvaAAGRCVKe4mk653.jpg"},
                     
                     @{@"no":@"7",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"8",@"name" : @"红酒",@"price":@"1000",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552572349&di=0829b09fcec69494e0d70ddabb6264a6&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5ab5c9ea15ce36d3a940651430f33a87e950b14a.jpg"},
                     
                     @{@"no":@"9",@"name":@"白葡萄酒",@"price" :@"50",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977730570&di=c4be060cd1d9d37d71b342d56165a8c2&imgtype=0&src=http%3A%2F%2Fimg4.99114.com%2Fgroup1%2FM00%2F1E%2FAE%2FwKgGTFXJ07KANWvaAAGRCVKe4mk653.jpg"},
                     
                     @{@"no":@"10",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"11",@"name" : @"红酒",@"price":@"1000",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552572349&di=0829b09fcec69494e0d70ddabb6264a6&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5ab5c9ea15ce36d3a940651430f33a87e950b14a.jpg"},
                     
                     @{@"no":@"12",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"13",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"14",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"15",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"16",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     @{@"no":@"17",@"name":@"鸡尾酒",@"price":@"100",@"image":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551977549578&di=c404f2fe34b17045d715b0fd9464f5eb&imgtype=0&src=http%3A%2F%2Fimg1.gtimg.com%2Fsh%2Fpics%2Fhv1%2F11%2F146%2F1244%2F80928341.jpg"} ,
                     
                     ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDataSource];
    self.sumPrice = 0;
    _tempArr = [NSMutableArray array];
    self.title = @"leon的购物车";
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"CartCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(self.view);
    }];
    
    //底部的结算条
    UIView *bottomTotalView = [[UIView alloc]init];
    bottomTotalView.frame = CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
    bottomTotalView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bottomTotalView];
    
//    添加subViews
    UILabel *bottomTitleLabel = [[UILabel alloc]init];
    bottomTitleLabel.text = @"一共购买:";
    bottomTitleLabel.textColor = [UIColor whiteColor];
    bottomTitleLabel.font = [UIFont systemFontOfSize:15];
    bottomTitleLabel.frame = CGRectMake(10, 15, 80, 20);
    [bottomTotalView addSubview:bottomTitleLabel];
    
    _itemCountLabel = [[UILabel alloc]init];
    _itemCountLabel.text = @"0";
    _itemCountLabel.textColor = [UIColor whiteColor];
    _itemCountLabel.font = [UIFont systemFontOfSize:15];
    _itemCountLabel.frame = CGRectMake(100, 15, 50, 20);
    [bottomTotalView addSubview:_itemCountLabel];
    
//    总金额
    _totalPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 15, 100, 20)];
    _totalPriceLabel.text = @"0 Yuan";
    _totalPriceLabel.textColor = [UIColor whiteColor];
    _totalPriceLabel.font = [UIFont systemFontOfSize:15];
    [bottomTotalView addSubview:_totalPriceLabel];
    
    _payBtn = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"购买" TitleColor:[UIColor whiteColor] Target:self SEL:@selector(clickToBuy)];
    [_payBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    _payBtn.enabled = false;
    _payBtn.layer.borderWidth = 1;
    _payBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _payBtn.frame = CGRectMake(kScreenWidth-60, 10, 50, 30);
    [bottomTotalView addSubview:_payBtn];
    
//    内边距调整
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.finalDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    解决xib重用问题
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([CartCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    
    //    indexPath.section
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    
    cell.model = self.finalDataArr[indexPath.row];
   
    return cell;
}

-(void)itemCount:(int)count itemPrice:(int)price isAdd:(BOOL)isadd no:(NSString *)itemNo{
    
//    NSLog(@"%d,%d",count,price);
    isadd ? (self.sumPrice += price) : (self.sumPrice -= price);
    self.
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d Yuan",self.sumPrice];
    [self.totalPriceLabel sizeToFit];
    
    NSArray *finalArr = [NSArray array];
    if (isadd) {
        //    加入id数组
        [self.tempArr addObject:itemNo];
    }else{
        //   减少id数组
        [self.tempArr removeObject:itemNo];
    }
    
    //    去重
    finalArr = [_tempArr valueForKeyPath:@"@distinctUnionOfObjects.self"];
    self.itemCountLabel.text = [NSString stringWithFormat:@"%ld种商品",finalArr.count];
    [self.itemCountLabel sizeToFit];
    
//    按钮可点
    if (_sumPrice > 0) {
        self.payBtn.enabled = true;
    }else{
        self.payBtn.enabled = false;
    }
    
    
}

-(void)clickToBuy{
    NSLog(@"去购买");
}


@end
