//
//  ViewController.m
//  XLTableViewDemo
//
//  Created by Mr.Song on 2018/8/8.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "ViewController.h"
#import "XLTableView.h"
#import "XLTableViewCell.h"

@interface ViewController ()<XLTableViewDataSource,XLTableViewDelegate>

@property(nonatomic, strong) XLTableView    *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[XLTableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

//cell的个数
- (NSInteger)numberOfRowsInTableView:(XLTableView *)tableView {
    return 30;
}

//获取cell
- (XLTableViewCell *)tableView:(XLTableView *)tableView cellForRowAtIndex:(NSInteger)index {
    XLTableViewCell *cell = [tableView dequeueReuseableCell];
    static int count = 0;
    if(!cell) {
        cell = [[XLTableViewCell alloc] initWithFrame:CGRectZero];
        cell.backgroundColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
        NSLog(@"New Cell--%d",count++);
    }
    return cell;
}


//cell的高度,有默认值
- (CGFloat)tableView:(XLTableView *)tableView heightForRowAtIndex:(NSInteger)index {
    return (50 + (50 * index / 3));
}



- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

   self.tableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
