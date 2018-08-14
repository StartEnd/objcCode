//
//  ViewController.m
//  IndexBarTableViewDemo
//
//  Created by Mr.Song on 2018/8/9.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "ViewController.h"
#import "IndexBarTableView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,IndexBarTableViewDelegate>
{
    IndexBarTableView *_tableView;
    NSMutableArray *dataSource;
    UIButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建tableView
    _tableView = [[IndexBarTableView alloc] initWithFrame:CGRectZero style:
            UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.indexDelegate = self;
    [self.view addSubview:_tableView];

    //创建一个按钮
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"Reload TableView" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //设置dataSource
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 100; ++i) {
        [dataSource addObject:@(i+1)];
    }


}

- (void)doAction:(UIButton *)sender {
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Reduse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:identifier];
    }

    cell.textLabel.text = [dataSource[indexPath.row] stringValue];

    return cell;
}

- (NSArray *)indexTitlesForIndexBarView:(IndexBarTableView *)indexBarView {
    static BOOL change = NO;

    NSArray *arrayTitles;
    if(change) {
        arrayTitles = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g"];
    } else{
        arrayTitles = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"o",@"m"];
    }

    change = !change;
    return arrayTitles;
}



@end
