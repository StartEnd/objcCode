//
//  ViewController.m
//  CustomTableView
//
//  Created by HO on 2017/5/23.
//  Copyright © 2017年 HO. All rights reserved.
//

#import "ViewController.h"
#import "YFTableView.h"
#import "YFTableViewCell.h"

#define SCREEB_SIZE [UIScreen mainScreen].bounds.size

@interface ViewController ()<YFTableViewDataSource>

@property (nonatomic,strong) YFTableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[YFTableView alloc] initWithFrame:CGRectMake(0, 20, SCREEB_SIZE.width, SCREEB_SIZE.height - 20)];
    self.tableView.dataSource = self;
    [self.tableView registerClassForCells:[YFTableViewCell class]];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfRows{
    return 30;
}

- (UIView *)cellForRow:(NSInteger)row{
//    NSString * ident = @"cell";
//    YFTableViewCell * cell = [[YFTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
    YFTableViewCell * cell = (YFTableViewCell *)[self.tableView dequeueReusableCell];
    cell.textLabel.text = @"测试";
    return cell;
}

- (CGFloat)rowHeight{
    return 55;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
