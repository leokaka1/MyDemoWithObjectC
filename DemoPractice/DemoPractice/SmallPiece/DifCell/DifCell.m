//
//  AutoHeight.m
//  DemoPractice
//
//  Created by Leon on 2019/5/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "DifCell.h"
#import "NormalImageCell.h"
#import "BottomImageCell.h"

@interface DifCell ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView *autoHeightTableView;
@property(strong,nonatomic) NormalImageCell *normal_ImageCell;
@property(strong,nonatomic) BottomImageCell *bottom_ImageCell;
@property(strong,nonatomic) UIView *bindView;
@property(strong,nonatomic) UIView *buyView;

@end


static NSString *normalCellId= @"normalCellId";
static NSString *bottomCellId= @"bottomCellId";

@implementation DifCell


-(UITableView *)autoHeightTableView{
    if (!_autoHeightTableView) {
        _autoHeightTableView = [[UITableView alloc]init];
        _autoHeightTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [_autoHeightTableView registerNib:[UINib nibWithNibName:@"NormalImageCell" bundle:nil] forCellReuseIdentifier:normalCellId];
        [_autoHeightTableView registerNib:[UINib nibWithNibName:@"BottomImageCell" bundle:nil] forCellReuseIdentifier:bottomCellId];
        _autoHeightTableView.showsHorizontalScrollIndicator = false;
        _autoHeightTableView.delegate = self;
        _autoHeightTableView.dataSource = self;
        _autoHeightTableView.estimatedRowHeight = 200;
        _autoHeightTableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _autoHeightTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"不同Cell展示";
    [self setupUI];
}

-(void)setupUI{
    
    [self.view addSubview:self.autoHeightTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 2 == 0) {
        BottomImageCell *bottomImageCell = [tableView dequeueReusableCellWithIdentifier:bottomCellId forIndexPath:indexPath];
        return bottomImageCell;
    }else{
        NormalImageCell *normalCell = [tableView dequeueReusableCellWithIdentifier:normalCellId forIndexPath:indexPath];
        normalCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (!normalCell) {
            normalCell = [[NormalImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:normalCellId];
        }
        return normalCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBindView)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBindView1)];
    
    if (indexPath.row % 2 == 0) {
        
        _bindView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _bindView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [_bindView addGestureRecognizer:tap];
        
        _buyView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-64, kScreenWidth,kScreenHeight-94)];
        _buyView.backgroundColor = [UIColor whiteColor];
        [_buyView addGestureRecognizer:tap1];
        [_bindView addSubview:_buyView];
        
        WeakSelf(weakSelf);
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.buyView.y = 94;
        }];
        
        [[UIApplication sharedApplication].keyWindow addSubview:_bindView];
    }
}


-(void)clickBindView{
    
    WeakSelf(weakSelf);
    
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        weakSelf.buyView.y = kScreenHeight;
        weakSelf.bindView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        [weakSelf.bindView removeFromSuperview];
    }];
}

-(void)clickBindView1{
    NSLog(@"123");
}

@end
