//
//  KeyAnimationViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "KeyAnimationViewController.h"

@interface KeyAnimationViewController ()
@property (nonatomic, strong) UIView *redView;

@end

@implementation KeyAnimationViewController

- (NSArray *)titleArrays
{
    return @[@"关键帧",@"路径",@"抖动"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.redView = ({
        UIView *redView = [UIView new];
        redView.backgroundColor = [UIColor redColor];
        redView.frame = CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100,100 ,100 );
        [self.view addSubview:redView];
        redView;
    });
    // Do any additional setup after loading the view.
}

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self keyPathAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}

- (void)keyPathAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(400, 320)];
    
    keyAnimation.values = @[value1,value2,value3,value4,value5];
    keyAnimation.duration = 4.0f;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];//动画的节奏
    keyAnimation.delegate = self;
    [_redView.layer addAnimation:keyAnimation forKey:@"keyPathAnimation"];
}

- (void)pathAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
    keyAnimation.path = path.CGPath;
    keyAnimation.duration = 3.0f;
    [_redView.layer addAnimation:keyAnimation forKey:@"pathAnimation"];
}

- (void)shakeAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    keyAnimation.values = [NSArray arrayWithObjects:value1,value2,value3, nil];
    keyAnimation.repeatCount = MAXFLOAT;
    [_redView.layer addAnimation:keyAnimation forKey:@"shakeAnimation"];
    
}
@end
