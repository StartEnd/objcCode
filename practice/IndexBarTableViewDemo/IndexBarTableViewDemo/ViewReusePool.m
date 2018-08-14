//
//  ViewReusePool.m
//  IndexBarTableViewDemo
//
//  Created by Mr.Song on 2018/8/9.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()
@property(nonatomic, strong) NSMutableSet *waitUseQueue;
@property(nonatomic, strong) NSMutableSet *useingQueue;

@end

@implementation ViewReusePool

- (instancetype)init {
    if (self = [super init]) {
        _waitUseQueue = [NSMutableSet set];
        _useingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReableView {
    UIView *view = [_waitUseQueue anyObject];
    if (view == nil) {
        return nil;
    }
    //更新重用队列和正在使用的队列
    [_waitUseQueue removeObject:view];
    [_useingQueue addObject:view];
    return view;
}

- (void)addResueView:(UIView *)view {
    if (view == nil) {
        return;
    }
    //添加新元素到使用队列
    [_useingQueue addObject:view];
}

// 重置所有元素,移动到等待队列
- (void)reset {
    UIView *view = nil;
    while ((view = [_useingQueue anyObject])) {
        [_useingQueue removeObject:view];
        [_waitUseQueue addObject:view];
    }
}

@end
