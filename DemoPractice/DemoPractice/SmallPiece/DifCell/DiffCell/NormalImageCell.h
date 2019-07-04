//
//  NormalImageCell.h
//  DemoPractice
//
//  Created by Leon on 2019/5/20.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NormalImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *newsHintLabel;

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;




@end

NS_ASSUME_NONNULL_END
