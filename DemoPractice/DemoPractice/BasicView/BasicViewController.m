//
//  BasicViewController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "BasicViewController.h"
#import "XZDrawController.h"

static NSString *identifier = @"BasicCell";
@interface BasicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView  *basicTableView;

@end

@implementation BasicViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = [NSArray array];
    self.detailArr = [NSArray array];
    self.controllerArr = [NSArray array];
//    [self setDataSource];
    [self setupUI];
}


-(void)setupUI{
    _basicTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenHeight)];
    _basicTableView.delegate  = self;
    _basicTableView.dataSource = self;
    [self.view addSubview:_basicTableView];
}

//-(void)setDataSource{
////    ConstDictionary *constDict = [ConstDictionary new];
//    self.titleArr = self.itemDict[@"title"];
//    self.detailArr = self.itemDict[@"detail"];
////    self.detailArr = [constDict getMainDictionary][@"detail"];
//}

#pragma mark - 基本TableView的代理方法
#pragma mark     UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text  = _titleArr[indexPath.row];
    cell.detailTextLabel.text = _detailArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    Class class = NSClassFromString(self.controllerArr[indexPath.row]);
    UIViewController *destVC = [[class alloc]init];
    
//    动画
    CATransition *trans = [CATransition animation];
    trans.type = @"pageCurl";
    trans.subtype = kCATransitionFromTop;
    trans.duration = 0.4;
    
    if ([destVC isMemberOfClass:[XZDrawController class]]) {
        [self presentViewController:destVC animated:true completion:nil];
    }else{
        [self.navigationController.view.layer addAnimation:trans forKey:kCATransition];
        [self.navigationController pushViewController:destVC animated:NO];
    }
    
}


@end
