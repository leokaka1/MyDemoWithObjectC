//
//  CollectionImageCell.h
//  DemoPractice
//
//  Created by Leon on 2019/3/14.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionImageCell : UICollectionViewCell

@property(strong,nonatomic) UIImage *cellImage;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end

NS_ASSUME_NONNULL_END
