//
//  ViewController.m
//  XLScrollView
//
//  Created by Mr.Song on 2018/8/14.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "ViewController.h"
#import "XLScrollView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) XLScrollView *scrollView;
@property (nonatomic, strong) UIScrollView  *sysScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[XLScrollView alloc] initWithFrame:CGRectZero];
    _scrollView.contentSize = CGSizeMake(0, 1024);
    [self.view addSubview:_scrollView];
    
    _sysScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _sysScrollView.contentSize = CGSizeMake(0, 1024);
 //   [self.view addSubview:_sysScrollView];
    _sysScrollView.delegate = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _scrollView.frame = self.view.bounds;
    _sysScrollView.frame = self.view.bounds;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"contentOffSet:%@",NSStringFromCGPoint(scrollView.contentOffset));
    NSLog(@"scrolView.bounds:%@",NSStringFromCGPoint(scrollView.bounds.origin));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
