//
//  TableViewController.m
//  动画进阶
//
//  Created by 任玉飞 on 15/12/24.
//  Copyright © 2015年 任玉飞. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *classNames;

@end

@implementation TableViewController

- (NSArray *)titleArray
{
    if (_titleArray == nil) {
        _titleArray = @[@"基础动画",
                        @"关键帧动画",
                        @"组动画",
                        @"过渡动画",
                        @"仿射变换",
                        @"综合案例",
                        @"等待动画"];
    }
    return _titleArray;
}

- (NSArray *)classNames
{
    if (!_classNames) {
        _classNames = @[@"BasicAnimationViewController",
                        @"KeyAnimationViewController",
                        @"GroupAnimationViewController",
                        @"TransAnimationViewController",
                        @"AffineTransformViewController",
                        @"ComprehensiveViewController",
                        @"LodingViewController"];
    }
    return _classNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *VC = class.new;
        VC.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
