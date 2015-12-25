//
//  TransAnimationViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "TransAnimationViewController.h"

@interface TransAnimationViewController ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *lab;
@property(nonatomic, assign) int index;

@end

@implementation TransAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _index = 0;
    self.bgView = ({
        UIView *bgVIew = [UIView new];
        bgVIew.frame = CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-200,180,260);
        [self.view addSubview:bgVIew];
        bgVIew;
    });
    
    self.lab = ({
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(_bgView.frame)/2-10, CGRectGetHeight(_bgView.frame)/2-20, 40, 40)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:50];
        [_bgView addSubview:lab];
        lab;
    });
    
    [self changeView:YES];
    // Do any additional setup after loading the view.
}

- (NSArray *)titleArrays
{
    return @[@"FADE",@"MOVELN",@"PUSH",
             @"REVEAL",@"CUBE",@"SUCK",
             @"OGLFLIP",@"RIPPLE",@"CURL",
             @"UNCURL",@"CAOPEN",@"CACLOSE"];
}

- (void)clickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self movelnAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckAnimation];
            break;
        case 6:
            [self oglflipAnimation];
            break;
        case 7:
            [self rippleAnimation];
            break;
        case 8:
            [self curlAnimation];
            break;
        case 9:
            [self uncurlAnimation];
            break;
            
        case 10:
            [self caopenAnimation];
            break;
        case 11:
            [self cacloseAnimation];
            break;
            
        default:
            break;
    }
}

- (void)fadeAnimation
{
    [self changeView:YES];
    CATransition *fade = [CATransition animation];
    fade.type = kCATransitionFade;//动画类型
    fade.subtype = kCATransitionFromRight;//动画方向
    fade.duration = 2.0f;
    [_bgView.layer addAnimation:fade forKey:@"fadeAnimation"];
}

- (void)movelnAnimation
{
    [self changeView:YES];
    CATransition *move = [CATransition animation];
    move.type = kCATransitionMoveIn;
    move.subtype = kCATransitionFromRight;
    move.duration = 2.0;
    [_bgView.layer addAnimation:move forKey:@"movelnAnimation"];
}

- (void)pushAnimation
{
    [self changeView:YES];
    CATransition *push = [CATransition animation];
    push.type = kCATransitionPush;
    push.type = kCATransitionFromRight;
    push.duration = 2.0f;
    [_bgView.layer addAnimation:push forKey:@"pushAnimation"];
    
}

- (void)revealAnimation
{
    [self changeView:YES];
    CATransition *rebeal = [CATransition animation];
    rebeal.type = kCATransitionReveal;
    rebeal.subtype = kCATransitionFromRight;
    rebeal.duration = 2.0f;
    [_bgView.layer addAnimation:rebeal forKey:@"revealAnimation"];
}

- (void)cubeAnimation
{
    [self changeView:YES];
    CATransition *cube = [CATransition animation];
    cube.type = @"cube";//翻转
    cube.subtype = kCATransitionFromRight;
    cube.duration = 2.0;
    [_bgView.layer addAnimation:cube forKey:@"cubeAnimation"];
}

- (void)suckAnimation
{
    [self changeView:YES];
    CATransition *suck = [CATransition animation];
    suck.type = @"suckEffect";
    suck.subtype = kCATransitionFromRight;
    suck.duration = 2.0f;
    [_bgView.layer addAnimation:suck forKey:@"suckAnimation"];
}

- (void)oglflipAnimation
{
    [self changeView:YES];
    CATransition *oglfip = [CATransition animation];
    oglfip.type = @"oglFlip";
    oglfip.subtype = kCATransitionFromRight;
    oglfip.duration = 2.0f;
    [_bgView.layer addAnimation:oglfip forKey:@"oglflipAnimation"];
}

- (void)rippleAnimation
{
    [self changeView:YES];
    CATransition *ripple = [CATransition animation];
    ripple.type = @"rippleEffect";
    ripple.subtype = kCATransitionFromRight;
    ripple.duration = 2.0;
    [_bgView.layer addAnimation:ripple forKey:@"rippleAnimation"];
}

- (void)curlAnimation
{
    [self changeView:YES];
    CATransition *curl = [CATransition animation];
    curl.type = @"pageCurl";
    curl.subtype = kCATransitionFromRight;
    curl.duration = 2.0f;
    [_bgView.layer addAnimation:curl forKey:@"curlAnimation"];
}

- (void)uncurlAnimation
{
    [self changeView:YES];
    CATransition *uncurl = [CATransition animation];
    uncurl.type = @"pageUnCurl";
    uncurl.subtype = kCATransitionFromRight;
    uncurl.duration = 2.0f;
    [_bgView.layer addAnimation:uncurl forKey:@"uncurlAnimation"];
}

- (void)caopenAnimation
{
    [self changeView:YES];
    CATransition *caopen = [CATransition animation];
    caopen.type = @"cameraIrisHollowOpen";
    caopen.subtype = kCATransitionFromRight;
    caopen.duration = 2.0f;
    [_bgView.layer addAnimation:caopen forKey:@"caopenAnimation"];
}

- (void)cacloseAnimation
{
    [self changeView:YES];
    CATransition *caclose = [CATransition animation];
    caclose.type = @"cameraIrisHollowClose";
    caclose.subtype = kCATransitionFromRight;
    caclose.duration = 2.0f;
    [_bgView.layer addAnimation:caclose forKey:@"cacloseAnimation"];
}

- (void)changeView:(BOOL)isLast
{
    if (_index > 3) {
        _index = 0;
    }else if (_index < 0){
        _index = 3;
    }
    
    NSArray *color = @[[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    NSArray *title = @[@"1",@"2",@"3",@"4"];
    _bgView.backgroundColor = [color objectAtIndex:_index];
    _lab.text = [title objectAtIndex:_index];
    
    if (isLast) {
        _index ++;
    }else{
        _index--;
    }
}
@end
