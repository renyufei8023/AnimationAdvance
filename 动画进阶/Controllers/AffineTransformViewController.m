//
//  AffineTransformViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "AffineTransformViewController.h"

@interface AffineTransformViewController ()

@end

@implementation AffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (NSArray *)titleArrays
{
    return @[@"位移",@"缩放",@"旋转",@"组合",@"反转"];
}

@end
