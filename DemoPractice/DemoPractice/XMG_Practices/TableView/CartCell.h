//
//  CartCell.h
//  DemoPractice
//
//  Created by 曹笑竹 on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol cellDelegate <NSObject>

-(void)itemCount:(int)count itemPrice:(int)price isAdd:(BOOL)isadd no:(NSString *)itemNo;

@end

@interface CartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemPicture;

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *itemCountLabel;

@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@property (nonatomic,strong) WineModel *model;

@property (nonatomic,strong) id<cellDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
