//
//  XZ_AnimationAlertView.m
//  Project_Demo
//
//  Created by caoxiaozhu on 2018/7/10.
//  Copyright © 2018年 caoxiaozhu. All rights reserved.
//

#import "XZ_AnimationAlertView.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface XZ_AnimationAlertView()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIView *bacView;
@property(nonatomic,strong)UIView *customerView;
@property(nonatomic,assign) XZ_AnimationPopStyle popStyle;
@property(nonatomic,assign) XZ_AnimationDismissStyle dismissStyle;
@property(nonatomic,assign) CGFloat defaultDuration;

/// 动画相关属性参数
/** 显示时动画时长，>= 0。不设置则使用默认的动画时长 */
@property (nonatomic) CGFloat popAnimationDuration;
/** 隐藏时动画时长，>= 0。不设置则使用默认的动画时长 */
@property (nonatomic) CGFloat dismissAnimationDuration;

/** 显示时背景的透明度，取值(0.0~1.0)，默认为0.5 */
@property (nonatomic) CGFloat popBGAlpha;
/** 显示时点击背景是否移除弹框，默认为NO。 */
@property (nonatomic) BOOL isClickBGDismiss;

@end

@implementation XZ_AnimationAlertView

-(instancetype)initWithCustomerView:(UIView *)view PopStyle:(XZ_AnimationPopStyle)popStyle DismissStyle:(XZ_AnimationDismissStyle)dismissStyle PopDuration:(NSInteger)popDur DismissDuration:(NSInteger)dismissDur ClickBacToHide:(BOOL)clickToHide BackAlpha:(CGFloat)popBGAlpha{
    
    if (!view) {
        return nil;
    }
    
    if (self) {
        
        self = [super init];
        
        _customerView = view;
        _defaultDuration = -0.1f;
        _popAnimationDuration = popDur;
        _dismissAnimationDuration = dismissDur;
        
        //如果没有值就默认为可以点击消失
        if (clickToHide) {
            _isClickBGDismiss = clickToHide;
        }else{
            _isClickBGDismiss = true;
        }
        
        _popBGAlpha = popBGAlpha;
        _bacView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _bacView.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:_popBGAlpha];
        [[UIApplication sharedApplication].keyWindow addSubview:_bacView];
        //添加View弹窗
        view.center = _bacView.center;
        [_bacView addSubview:view];
        
        //模式赋值
        _popStyle = popStyle;
        _dismissStyle = dismissStyle;
        
        [self pop];
    }
    return self;
}

#pragma mark - 弹窗
-(void)pop{
    
    __weak typeof(self) ws = self;
    
    NSTimeInterval time = [self getPopDefaultDuration:_popStyle];
    NSTimeInterval duration = (_popAnimationDuration < 0.0f) ? time : _popAnimationDuration;
    
    switch (self.popStyle) {
        case XZ_AnimationPopStyleScale:
        {
            [self animationWithLayer:_customerView.layer duration:-0.1f values:@[@0.0, @1.2, @1.0]];// 另外一组动画值(the other animation values) @[@0.0, @1.2, @0.9, @1.0]
        }
            break;
            
        case XZ_AnimationPopStyleShakeFromTop:
        case XZ_AnimationPopStyleShakeFromBottom:
        case XZ_AnimationPopStyleShakeFromLeft:
        case XZ_AnimationPopStyleShakeFromRight:
            
        {
            CGPoint startPosition = self.customerView.layer.position;
            if (self.popStyle == XZ_AnimationPopStyleShakeFromTop) {
                self.customerView.layer.position = CGPointMake(startPosition.x, -startPosition.y);
            }else if (self.popStyle == XZ_AnimationPopStyleShakeFromBottom) {
                self.customerView.layer.position = CGPointMake(startPosition.x, CGRectGetMaxY(_bacView.frame) + startPosition.y);
            } else if (self.popStyle == XZ_AnimationPopStyleShakeFromLeft) {
                self.customerView.layer.position = CGPointMake(-startPosition.x, startPosition.y);
            } else {
                self.customerView.layer.position = CGPointMake(CGRectGetMaxX(_bacView.frame) + startPosition.x, startPosition.y);
            }
            
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                ws.customerView.layer.position = startPosition;
            } completion:nil];
        }
            break;
            
        case XZ_AnimationPopStyleCardDropFromLeft:
        case XZ_AnimationPopStyleCardDropFromRight:
        {
            CGPoint startPosition = self.customerView.layer.position;
            if (self.popStyle == XZ_AnimationPopStyleCardDropFromLeft) {
                self.customerView.layer.position = CGPointMake(startPosition.x * 1.0, -startPosition.y);
                self.customerView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(15.0));
            } else {
                self.customerView.layer.position = CGPointMake(startPosition.x * 1.0, -startPosition.y);
                self.customerView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-15.0));
            }
            
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                ws.customerView.layer.position = startPosition;
            } completion:nil];
            
            [UIView animateWithDuration:duration*0.6 animations:^{
                ws.customerView.layer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS((ws.popStyle == XZ_AnimationPopStyleCardDropFromRight) ? 5.5 : -5.5), 0, 0, 0);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:duration*0.2 animations:^{
                    ws.customerView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS((ws.popStyle == XZ_AnimationPopStyleCardDropFromRight) ? -1.0 : 1.0));
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:duration*0.2 animations:^{
                        ws.customerView.transform = CGAffineTransformMakeRotation(0.0);
                    } completion:nil];
                }];
            }];
        }
            break;
            
        default:
            break;
    }
    
    //添加一个暗黑色的背景
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    tap.delegate = self;
    [tap addTarget:self action:@selector(clickToHide)];
    [_bacView addGestureRecognizer:tap];
    
}

#pragma mark - 关窗
-(void)dismiss{
    __weak typeof(self) ws = self;
    
    NSTimeInterval time = [self getDismissDefaultDuration:self.dismissStyle];
    NSTimeInterval duration = (_dismissAnimationDuration < 0.0f) ? time : _dismissAnimationDuration;
    
    switch (self.dismissStyle) {
        case XZ_AnimationDismissStyleScale:
        {
            [self animationWithLayer:_customerView.layer duration:-_defaultDuration values:@[@1.0, @0.66, @0.33, @0.01]];
        }
            break;
            
        case XZ_AnimationDismissStyleDropToTop:
        case XZ_AnimationDismissStyleDropToBottom:
        case XZ_AnimationDismissStyleDropToLeft:
        case XZ_AnimationDismissStyleDropToRight:
        {
            CGPoint startPosition = self.customerView.layer.position;
            CGPoint endPosition = self.customerView.layer.position;
            if (self.dismissStyle == XZ_AnimationDismissStyleDropToTop) {
                endPosition = CGPointMake(startPosition.x, -startPosition.y);
            }else if (self.dismissStyle == XZ_AnimationDismissStyleDropToBottom) {
                endPosition = CGPointMake(startPosition.x, CGRectGetMaxY(_bacView.frame) + startPosition.y);
            } else if (self.dismissStyle == XZ_AnimationDismissStyleDropToLeft) {
                endPosition = CGPointMake(-startPosition.x, startPosition.y);
            } else {
                endPosition = CGPointMake(CGRectGetMaxX(_bacView.frame) + startPosition.x, startPosition.y);
            }
            
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                ws.customerView.layer.position = endPosition;
            } completion:nil];
        }
            break;
            
        case XZ_AnimationDismissStyleCardDropToLeft:
        case XZ_AnimationDismissStyleCardDropToRight:
        {
            CGPoint startPosition = self.customerView.layer.position;
            BOOL isLandscape = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
            __block CGFloat rotateEndY = 0.0f;
            [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                if (self.dismissStyle == XZ_AnimationDismissStyleCardDropToLeft) {
                    ws.customerView.transform = CGAffineTransformMakeRotation(M_1_PI * 0.75);
                    if (isLandscape) rotateEndY = fabs(ws.customerView.frame.origin.y);
                    ws.customerView.layer.position = CGPointMake(startPosition.x, CGRectGetMaxY(ws.frame) + startPosition.y + rotateEndY);
                } else {
                    ws.customerView.transform = CGAffineTransformMakeRotation(-M_1_PI * 0.75);
                    if (isLandscape) rotateEndY = fabs(ws.customerView.frame.origin.y);
                    ws.customerView.layer.position = CGPointMake(startPosition.x * 1.25, CGRectGetMaxY(ws.frame) + startPosition.y + rotateEndY);
                }
            } completion:nil];
        }
            break;
            
        case XZ_AnimationDismissStyleCardDropToTop:
        {
            CGPoint startPosition = self.customerView.layer.position;
            CGPoint endPosition = CGPointMake(startPosition.x, -startPosition.y);
            [UIView animateWithDuration:duration*0.2 animations:^{
                ws.customerView.layer.position = CGPointMake(startPosition.x, startPosition.y + 50.0f);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:duration*0.8 animations:^{
                    ws.customerView.layer.position = endPosition;
                } completion:nil];
            }];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark: 避免点击customerView触碰点击事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.customerView]) {
        return NO;
    }
    return YES;
}

-(void)hideWithDur:(CGFloat)dur{
    __weak typeof(self)weakSelf = self;
    _dismissAnimationDuration = dur;
    [UIView animateWithDuration:_dismissAnimationDuration animations:^{
        weakSelf.bacView.alpha = 0.0;
        [self dismiss];
    }];
}

-(void)clickToHide{
    //    NSLog(@"haha");
    __weak typeof(self)weakSelf = self;
    if (_isClickBGDismiss) {
        [UIView animateWithDuration:_dismissAnimationDuration animations:^{
            weakSelf.bacView.alpha = 0.0;
            [self dismiss];
        }];
    }
}

- (void)animationWithLayer:(CALayer *)layer duration:(CGFloat)duration values:(NSArray *)values
{
    CAKeyframeAnimation *KFAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    KFAnimation.duration = duration;
    KFAnimation.removedOnCompletion = NO;
    KFAnimation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *valueArr = [NSMutableArray arrayWithCapacity:values.count];
    for (NSUInteger i = 0; i<values.count; i++) {
        CGFloat scaleValue = [values[i] floatValue];
        [valueArr addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(scaleValue, scaleValue, scaleValue)]];
    }
    KFAnimation.values = valueArr;
    KFAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [layer addAnimation:KFAnimation forKey:nil];
}

#pragma mark 时间调整
- (NSTimeInterval)getPopDefaultDuration:(XZ_AnimationPopStyle)animationPopStyle
{
    NSTimeInterval defaultDuration = 0.0f;
    if (animationPopStyle == XZ_AnimationPopStyleNO) {
        defaultDuration = 0.2f;
    } else if (animationPopStyle == XZ_AnimationPopStyleScale) {
        defaultDuration = 0.3f;
    } else if (animationPopStyle == XZ_AnimationPopStyleShakeFromTop ||
               animationPopStyle == XZ_AnimationPopStyleShakeFromBottom ||
               animationPopStyle == XZ_AnimationPopStyleShakeFromLeft ||
               animationPopStyle == XZ_AnimationPopStyleShakeFromRight ||
               animationPopStyle == XZ_AnimationPopStyleCardDropFromLeft ||
               animationPopStyle == XZ_AnimationPopStyleCardDropFromRight) {
        defaultDuration = 0.8f;
    }
    return defaultDuration;
}

- (NSTimeInterval)getDismissDefaultDuration:(XZ_AnimationDismissStyle)animationDismissStyle
{
    NSTimeInterval defaultDuration = 0.0f;
    if (animationDismissStyle == XZ_AnimationDismissStyleNO) {
        defaultDuration = 0.2f;
    } else if (animationDismissStyle == XZ_AnimationDismissStyleScale) {
        defaultDuration = 0.2f;
    } else if (animationDismissStyle == XZ_AnimationDismissStyleDropToTop ||
               animationDismissStyle == XZ_AnimationDismissStyleDropToBottom ||
               animationDismissStyle == XZ_AnimationDismissStyleDropToLeft ||
               animationDismissStyle == XZ_AnimationDismissStyleDropToRight ||
               animationDismissStyle == XZ_AnimationDismissStyleCardDropToLeft ||
               animationDismissStyle == XZ_AnimationDismissStyleCardDropToRight ||
               animationDismissStyle == XZ_AnimationDismissStyleCardDropToTop) {
        defaultDuration = 0.8f;
    }
    return defaultDuration;
}

@end
