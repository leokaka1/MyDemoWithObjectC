//
//  CollectionImageCell.m
//  DemoPractice
//
//  Created by Leon on 2019/3/14.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "CollectionImageCell.h"

@interface CollectionImageCell()




@end

@implementation CollectionImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

-(void)setCellImage:(UIImage *)cellImage{
    self.cellImageView.image = _cellImage;
}

@end
