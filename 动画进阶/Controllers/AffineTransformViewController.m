//
//  AffineTransformViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "AffineTransformViewController.h"

@interface AffineTransformViewController ()
@property (nonatomic, strong) UIView *redView;

@end

@implementation AffineTransformViewController

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

- (NSArray *)titleArrays
{
    return @[@"位移",@"缩放",@"旋转",@"组合",@"反转"];
}

-(void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self animation1];
            break;
        case 1:
            [self animation2];
            break;
        case 2:
            [self animation3];
            break;
        case 3:
            [self animation4];
            break;
        case 4:
            [self animation5];
            break;
        default:
            break;
    }
}

- (void)animation1
{
    _redView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        _redView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];

}

- (void)animation2
{
    _redView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        _redView.transform = CGAffineTransformMakeScale( 0.5, 0.5);
    }];
}

- (void)animation3
{
    _redView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        _redView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
}

- (void)animation4
{
    _redView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI_2);
        CGAffineTransform transform2 = CGAffineTransformTranslate(transform1, 100, 100);
        _redView.transform = CGAffineTransformScale(transform2, 0.8, 0.8);
    }];
}

- (void)animation5
{
    _redView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2.0f animations:^{
        _redView.transform = CGAffineTransformInvert(CGAffineTransformMakeTranslation(100, 100));
    }];
    
}
@end
