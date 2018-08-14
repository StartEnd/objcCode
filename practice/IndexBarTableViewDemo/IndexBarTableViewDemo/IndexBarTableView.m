//
//  IndexBarTableView.m
//  IndexBarTableViewDemo
//
//  Created by Mr.Song on 2018/8/9.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "IndexBarTableView.h"
#import "ViewReusePool.h"

@interface IndexBarTableView()
{
    ViewReusePool   *_reusePool;
    UIView          *_containerView;
}

@end

@implementation IndexBarTableView


//重写reloadData方法

//
- (void)reloadData {
    [super reloadData];

    // 懒加载
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
        //插入到自己的上层,防止跟随移动
        [self.superview insertSubview:_containerView aboveSubview:self];
    }

    if (_reusePool == nil) {
        _reusePool = [[ViewReusePool alloc] init];
    }

    // 将所有View置于可重用状态
    [_reusePool reset];
    
    //对IndexBar进行置
   [self reloadIndexBar];
}

//
- (void)reloadIndexBar {

    // 获取当前索引的数据
    NSArray<NSString *> *arrayTitles = nil;
    if([self.indexDelegate respondsToSelector:@selector(indexTitlesForIndexBarView:)]) {
        arrayTitles = [self.indexDelegate indexTitlesForIndexBarView:self];
    }
    // 异常处理
    if(arrayTitles == nil || arrayTitles.count <= 0) {
        _containerView.hidden = YES;
        return;
    }

    // 初始化相关cell添加到containerView中
    //cell 的frame计算
    NSInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.bounds.size.height / count;

    for (NSUInteger i = 0; i < count; ++i) {
        //获取title
        NSString *title = arrayTitles[i];

        //获取重用button
        UIButton *button = (UIButton *)[_reusePool dequeueReableView];

        if(button == nil) {
            button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor redColor];

            NSLog(@"新建了Button");
            [_reusePool addResueView:button];
        }
        else {
            NSLog(@"复用了Button");
        }
        [button setTitle:title forState:UIControlStateNormal];
        //button的frame
        button.frame = CGRectMake(0, buttonHeight * i, buttonWidth, buttonHeight);
        [_containerView addSubview:button];
    }

    //_containerView的frame
    [_containerView setHidden:NO];
    _containerView.frame = CGRectMake(self.bounds.size.width - buttonWidth, 0, buttonWidth, self.bounds.size.height);

}

@end
