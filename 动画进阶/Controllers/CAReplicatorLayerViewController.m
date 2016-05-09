//
//  CAReplicatorLayerViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 16/5/9.
//  Copyright © 2016年 任玉飞. All rights reserved.
//

#import "CAReplicatorLayerViewController.h"
#import "CAReplicatorLayerAnimation.h"

@interface CAReplicatorLayerViewController ()


@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH - 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    NSMutableArray *animations = [NSMutableArray arrayWithCapacity:5];
    [animations addObject:[CAReplicatorLayerAnimation CircleAnimation]];
    [animations addObject:[CAReplicatorLayerAnimation WaveAnimation]];
    [animations addObject:[CAReplicatorLayerAnimation TriangleAnimation]];
    [animations addObject:[CAReplicatorLayerAnimation GridAnimation]];
    
    CGFloat radius = SCREEN_WIDTH / 2;
    for (NSInteger index = 0; index < animations.count; index++) {
        NSInteger col = index % 2;
        NSInteger row = index / 2;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(radius * col, radius * row, radius, radius)];
        view.backgroundColor = [UIColor whiteColor];
        [view.layer addSublayer:[animations objectAtIndex:index]];
        [bgView addSubview:view];
    }
}


@end
