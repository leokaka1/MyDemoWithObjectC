//
//  AutoHeight.m
//  DemoPractice
//
//  Created by Leon on 2019/5/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "AutoHeight.h"

@interface AutoHeight ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView *autoHeight_TableView;

@end

@implementation AutoHeight

-(UITableView *)difHeight_TableView{
    if (!_autoHeight_TableView) {
        _autoHeight_TableView = [[UITableView alloc]init];
       _autoHeight_TableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _autoHeight_TableView.delegate = self;
        _autoHeight_TableView.dataSource = self;
        _autoHeight_TableView.showsVerticalScrollIndicator = false;
    }
    return _autoHeight_TableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = Color_White;
    self.title = @"自动高度";
}

#pragma MARK:TableViewDelegate
//rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}


//点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

////UITableViewCell
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}


@end

