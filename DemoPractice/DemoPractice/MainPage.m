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

@interface MainPage ()

@property(strong,nonatomic) UITableView  *basicTableView;


@end

@implementation MainPage

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setDataSource];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
}

-(void)setDataSource{
    self.titleArr = [NSArray array];
    self.detailArr = [NSArray array];
    ConstDictionary *constDict = [ConstDictionary new];
    self.titleArr = [constDict getMainDictionary][@"title"];
    self.detailArr = [constDict getMainDictionary][@"detail"];
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
            
        case 1:
        {
            TestDemo *testDemo = [TestDemo new];
            [self.navigationController pushViewController:testDemo animated:true];
        }
            break;
            
        default:
            break;
    }
}

@end
