//
//  ViewController.m
//  XLTableViewDemo
//
//  Created by Mr.Song on 2018/8/8.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "ViewController.h"
#import "XLTableView.h"

@interface ViewController ()

@property(nonatomic, strong) XLTableView    *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[XLTableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
  //  self.tableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
