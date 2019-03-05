//
//  BasicViewController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "BasicViewController.h"


static NSString *identifier = @"BasicCell";
@interface BasicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView  *basicTableView;

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


-(void)setupUI{
    _basicTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenHeight)];
    _basicTableView.delegate  = self;
    _basicTableView.dataSource = self;
    [self.view addSubview:_basicTableView];
}


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

@end
