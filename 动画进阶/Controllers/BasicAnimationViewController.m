//
//  BasicAnimationViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()
@property (nonatomic, strong) UIView *redView;

@end

@implementation BasicAnimationViewController

- (NSArray *)titleArrays
{

    return  @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];

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
    
}

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
            
        default:
            break;
    }
}

- (void)positionAnimation
{
    
    CABasicAnimation *basciAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basciAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_WIDTH/-75)];
    basciAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    basciAnimation.removedOnCompletion = NO;//需要把它设置为no
    basciAnimation.fillMode = kCAFillModeBoth;//设置layer最后是否保留最后的
    basciAnimation.duration = 2.0;
    basciAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    [_redView.layer addAnimation:basciAnimation forKey:@"ryfbasicanimation"];
    
    /**
     *  直接使用UIView的方法实现动画
     */
    [UIView animateWithDuration:2.0f animations:^{
        _redView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    }];
    
    /**
     *  采用UIView的begin和commit来实现的动画
     */
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0f];
    _redView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    [UIView commitAnimations];
}

- (void)opacityAniamtion
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    basicAnimation.toValue = [NSNumber numberWithFloat:0.0f];
    basicAnimation.duration = 2.0;
    [_redView.layer addAnimation:basicAnimation forKey:@"ryfbasicanimation"];
}

- (void)scaleAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    basicAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    basicAnimation.duration = 3.0f;
    [_redView.layer addAnimation:basicAnimation forKey:@"ryfbasicanimation"];
}

- (void)rotateAnimation
{
    /**
     *  直接使用key
     */
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnimation1.toValue = [NSNumber numberWithFloat:M_PI];
    basicAnimation1.duration = 2.0;
    [_redView.layer addAnimation:basicAnimation1 forKey:@"ryfbasicanimation"];
    
    /**
     *  使用CATransform3DMakeRotation实现
     */
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
    basicAnimation.duration = 2.0;
    [_redView.layer addAnimation:basicAnimation forKey:@"ryfbasicanimation"];
}

- (void)backgroundAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimation.toValue = (id)[UIColor greenColor].CGColor;
    basicAnimation.duration = 2.0;
    [_redView.layer addAnimation:basicAnimation forKey:@"ryfbasicanimation"];
}
@end
