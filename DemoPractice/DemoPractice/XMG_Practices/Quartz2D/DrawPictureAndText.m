//
//  DrawPictureAndText.m
//  DemoPractice
//
//  Created by Leon on 2019/3/10.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "DrawPictureAndText.h"

@interface DrawPictureAndText ()

@property(strong,nonatomic) UIImageView     *imageView;

@end

@implementation DrawPictureAndText

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 64, kScreenWidth, 375);
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    [self drawRoundPicture];

}

-(void)drawRoundPicture{
    UIImage *image= [UIImage imageNamed:@"风景123"];
    CGFloat margin = 10;
    CGSize size = CGSizeMake(image.size.width + 2* margin, image.size.height + 2*margin);
    
    UIGraphicsBeginImageContext(size);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width,size.height)];
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(margin, margin, image.size.width, image.size.height)];
    [[UIColor blueColor]set];
    [path fill];
    [imagePath addClip];
    [image drawAtPoint:CGPointMake(margin, margin)];
    
    UIImage *newImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = newImage;
}


-(void)drawImageAndText{
    UIImage *image = [UIImage imageNamed:@"personBg"];
    NSString *text = @"@LEON图片";
    
    //    l开启一个位图上下文
    UIGraphicsBeginImageContext(image.size);
    
    //    写入图片
    [image drawAtPoint:CGPointZero];
    
    //    写入文字
    [text drawAtPoint:CGPointMake(50, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30 ]}];
    
    //    生成一张新图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //    销毁上下文
    UIGraphicsEndImageContext();
    //    添加到imageView上
    _imageView.image =newImage;
}

@end
