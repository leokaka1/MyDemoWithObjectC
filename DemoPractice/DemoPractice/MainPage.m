//
//  MainPage.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "MainPage.h"
#import "MainPage+OtherFunction.h"
#import "Person.h"

static NSString *identifier = @"cell";

@interface MainPage ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView  *basicTableView;
@property(strong,nonatomic) NSArray *titleArr;
@property(strong,nonatomic) NSArray *detailArr;

@end

@implementation MainPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self setDataSource];
    [self setupUI];
    
    Person *person = [Person shareManager];
    Person *person1= [Person shareManager];
    NSLog(@"%p --- %p",person,person1);
    
}

-(void)setDataSource{
    _titleArr = [NSArray array];
    _detailArr = [NSArray array];
    ConstDictionary *constDict = [ConstDictionary new];
    _titleArr = [constDict getMainDictionary][@"title"];
    _detailArr = [constDict getMainDictionary][@"detail"];
    
}

//设置UI
-(void)setupUI{
    
    _basicTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenHeight)];
    _basicTableView.delegate  = self;
    _basicTableView.dataSource = self;
    [self.view addSubview:_basicTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
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
    
    switch (indexPath.row) {
        case 0:
            {
                CollectionViewPractice *collectionView = [CollectionViewPractice new];
                [self.navigationController pushViewController:collectionView animated:true];
            }
            break;
            
        default:
            break;
    }
    
}

@end
