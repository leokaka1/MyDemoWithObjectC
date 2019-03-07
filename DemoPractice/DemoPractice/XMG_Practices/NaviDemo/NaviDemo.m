
//
//  NaviDemo.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "NaviDemo.h"

#define oriOffsetY -250
#define oriH 250

@interface NaviDemo ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UIButton *backBtn;
@property(strong,nonatomic) UIView *personBcView;
@property(strong,nonatomic) UIImageView *personBackView;
@property(strong,nonatomic) UIImageView *personIcon;

@end

@implementation NaviDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    设置左上角的返回按钮
    _backBtn = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"返回" TitleColor:[UIColor whiteColor] Target:self SEL:@selector(goback)];
    
    UITableView *mainTableView = [[UITableView alloc]init];
    mainTableView.backgroundColor = [UIColor whiteColor];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    //    tableView的偏移量
    mainTableView.contentInsetAdjustmentBehavior = NO;
    mainTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    mainTableView.contentInset = UIEdgeInsetsMake(250-64, 0, 0, 0);
    [self.view addSubview:mainTableView];
    
    
//    设置导航栏控制透明
//    self.navigationController.navigationBar.alpha = 0;
//    UIImage *image = [KutilManager createImageWithColor:[UIColor redColor]];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
//    设置导航栏下面的阴影图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
//    动态添加一个可以变动的view
    [self.navigationController.navigationBar xz_setBackgroundColor:[UIColor clearColor]];
    
//    headerView
//    UIView *headerView =[[UIView alloc]init];
//    headerView.frame  = CGRectMake(0, 0, 0, 250);
//    headerView.backgroundColor = [UIColor redColor];
//    mainTableView.tableHeaderView = headerView;
    
    _personBcView = [[UIView alloc]init];
    _personBcView.backgroundColor = [UIColor redColor];
    _personBcView.frame = CGRectMake(0, 0, kScreenWidth, 250);
    
    _personBackView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personBg"]];
//    _personBackView.frame = CGRectMake(0, 0, kScreenWidth, 250);
    
    _personIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"person_icon"]];
//    _personIcon.frame = CGRectMake(0, 0, 50, 50);
    _personIcon.center = _personBcView.center;
    _personIcon.frame = CGRectMake(0, 0, 80, 80);
    _personIcon.aliCornerRadius = 40.0f;
    
    [_personBcView addSubview:_personBackView];
    [_personBackView addSubview:_personIcon];
    
    __weak typeof(self) weakSelf = self;
    [_personBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.personBcView);
    }];
    
    [_personIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.personBcView.mas_centerX);
        make.centerX.equalTo(weakSelf.personBcView.mas_centerX);
        make.centerY.equalTo(weakSelf.personBcView.mas_centerY);
    }];
    
    [self.view addSubview:_personBcView];
    
    

//    _personBackView = []
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = @"Leon";
    
    return cell;
    
}

//监听tableView滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor *color = [UIColor blueColor];
//    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offsetY = scrollView.contentOffset.y - oriOffsetY;
//    原始高度-偏移量
    CGFloat h = oriH - offsetY;
    if (offsetY > 0) {
        CGFloat alpha = 1 - ((200 - offsetY) / 64);
        [self.navigationController.navigationBar xz_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
//        NSLog(@"%f",h);
        
//        添加返回按钮
        [_backBtn setAlpha:alpha];
//        减少背景高度
//        _personBackView.frame = CGRectMake(0, 0, kScreenWidth, h);
        _personBcView.frame = CGRectMake(0, 0, kScreenWidth, h);
//        _personIcon.alpha = alpha;
        
    } else {
        [self.navigationController.navigationBar xz_setBackgroundColor:[color colorWithAlphaComponent:0]];
        
//        隐藏返回按钮
        [_backBtn setAlpha:0];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_backBtn];
}

//返回的时候回复导航栏颜色
-(void)goback{
    [self.navigationController.navigationBar xz_reset];
    [self.navigationController popViewControllerAnimated:true];
}

@end
