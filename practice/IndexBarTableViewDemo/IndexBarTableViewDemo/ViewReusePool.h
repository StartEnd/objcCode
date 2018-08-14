//
//  ViewReusePool.h
//  IndexBarTableViewDemo
//
//  Created by Mr.Song on 2018/8/9.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewReusePool : NSObject

// 获取需要复用的视图
- (UIView *)dequeueReableView;

// 添加可重用视图
- (void)addResueView:(UIView *)view;

// 重置
- (void)reset;

@end
