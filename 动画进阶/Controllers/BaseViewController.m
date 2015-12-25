//
//  BaseViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "BaseViewController.h"
#import "Masonry.h"

@interface BaseViewController ()
@property (nonatomic, copy) NSArray *titleArray;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)initData
{
    _titleArray = [self titleArrays];
}
- (void)initView {
    UIView *bgView = [UIView new];
//    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.offset(SCREEN_WIDTH);
        make.height.offset(180);
    }];
    
    CGFloat margin = (SCREEN_WIDTH - 240) / 5;
    CGFloat btnWidth = 60;
    CGFloat btnHeigh = 30;
    
    
    if (_titleArray&&_titleArray.count>0) {
        for (int i = 0; i<_titleArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            [bgView addSubview:btn];
            NSInteger row = i / 4 ;
            NSInteger loc = i % 4;
            CGFloat btnX = margin + (margin + btnWidth) * loc;
            CGFloat btnY = margin + (margin + btnHeigh) * row;
            
            btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeigh);
            [btn setTitle:[_titleArray objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor grayColor]];
            btn.tag = i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    // Dispose of any resources that can be recreated.
}

- (void)clickBtn:(UIButton *)btn
{
    
}

@end
