//
//  GroupAnimationViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController ()
@property (nonatomic, strong) UIView *redView;

@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = ({
        UIView *redView = [UIView new];
        redView.backgroundColor = [UIColor redColor];
        redView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50,50,50);
        [self.view addSubview:redView];
        redView;
    });
    // Do any additional setup after loading the view.
}

- (NSArray *)titleArrays
{
    return @[@"同时",@"连续"];
}

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self tongshiAnimation];
            break;
        case 1:
            [self lianxuAnimation];
            break;
            
        default:
            break;
    }
}

- (void)tongshiAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    keyAnimation.values = @[value0,value1,value2,value3,value4,value5];
    
    //缩放
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnimation1.fromValue = [NSNumber numberWithFloat:0.8f];
    basicAnimation1.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转
    CABasicAnimation *basicAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnimation2.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyAnimation,basicAnimation1,basicAnimation2];
    groupAnimation.duration = 5.0f;
    [_redView.layer addAnimation:groupAnimation forKey:@"tongshiAnimation"];
    
}

- (void)lianxuAnimation
{
    CFTimeInterval currentTime = CACurrentMediaTime();
    //平移
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_WIDTH/2-75)];
    basicAnimation.beginTime = currentTime;
    basicAnimation.duration = 2.0f;
    basicAnimation.fillMode = kCAFillModeForwards;//layer会停留在最后一个点
    basicAnimation.removedOnCompletion = NO;
    [_redView.layer addAnimation:basicAnimation forKey:@"basicAnimation"];
    
    //缩放
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnimation1.fromValue = [NSNumber numberWithFloat:0.8f];
    basicAnimation1.toValue = [NSNumber numberWithFloat:2.0f];
    basicAnimation1.duration = 2.0f;
    basicAnimation1.beginTime = currentTime + 2.0f;
    basicAnimation1.removedOnCompletion = NO;
    basicAnimation1.fillMode = kCAFillModeForwards;
    [_redView.layer addAnimation:basicAnimation1 forKey:@"basicAnimation1"];
    
    //旋转
    CABasicAnimation *basicAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnimation2.toValue = [NSNumber numberWithFloat:M_PI*4];
    basicAnimation2.duration = 2.0f;
    basicAnimation2.beginTime = currentTime + 4.0f;
    basicAnimation2.removedOnCompletion = NO;
    basicAnimation2.fillMode = kCAFillModeForwards;
    [_redView.layer addAnimation:basicAnimation2 forKey:@"basicAnimation2"];
    
}
@end
