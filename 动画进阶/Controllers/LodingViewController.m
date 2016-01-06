//
//  LodingViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 16/1/6.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

#import "LodingViewController.h"

@interface LodingViewController ()

@end

@implementation LodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.fillColor = [UIColor clearColor].CGColor;
    bgLayer.strokeColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0].CGColor;
    bgLayer.lineWidth = 5;
    bgLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)].CGPath;
    [self.view.layer addSublayer:bgLayer];
    
    CAShapeLayer *ovalLayer = [CAShapeLayer layer];
    ovalLayer.fillColor = [UIColor clearColor].CGColor;
    ovalLayer.strokeColor = [UIColor redColor].CGColor;
    ovalLayer.lineWidth = 5;
    ovalLayer.lineDashPattern = @[@6,@3];
    ovalLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)].CGPath;
    [self.view.layer addSublayer:ovalLayer];
    
    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    basic1.fromValue = @-1;
    basic1.toValue = @1.0;
    
    CABasicAnimation *basic2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basic2.fromValue = @0;
    basic2.toValue = @1.0;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[basic1 , basic2];
    animationGroup.duration = 1.5;
    animationGroup.repeatCount = CGFLOAT_MAX;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [ovalLayer addAnimation:animationGroup forKey:nil];
    // Do any additional setup after loading the view.
}

@end
