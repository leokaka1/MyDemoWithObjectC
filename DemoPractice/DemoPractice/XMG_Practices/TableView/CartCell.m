
//
//  CartCell.m
//  DemoPractice
//
//  Created by 曹笑竹 on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CartCell.h"

@interface CartCell()

@property(nonatomic,assign) int count;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *no;

@end

@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.count = 0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(WineModel *)model{
    self.itemNameLabel.text = model.name;
    self.priceLabel.text = model.price;
    self.price = model.price;
    self.no = model.no;
}

- (IBAction)add:(UIButton *)sender {
    self.count++;
    self.itemCountLabel.text = [NSString stringWithFormat:@"%d",(self.count)];
    int price = [self.price intValue];
    [self.delegate itemCount:self.count itemPrice: price isAdd:true];
}


- (IBAction)remove:(UIButton *)sender {
    self.count--;
    if (self.count < 0) {
        self.count = 0;
    }
    self.itemCountLabel.text = [NSString stringWithFormat:@"%d",(self.count)];
    
    int price = [self.price intValue];
    [self.delegate itemCount:self.count itemPrice: price isAdd:false];
}


@end
