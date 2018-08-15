//
//  YFTableView.h
//  CustomTableView
//
//  Created by HO on 2017/5/23.
//  Copyright © 2017年 HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YFTableViewDataSource <NSObject>
//表示表中的行数
- (NSInteger)numberOfRows;
//获取给定的单元格
- (UIView *)cellForRow:(NSInteger)row;
//返回表格的高度
- (CGFloat)rowHeight;

@end

@interface YFTableView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic,assign) id <YFTableViewDataSource> dataSource;

//出现一个可以重用的单元格
- (UIView *)dequeueReusableCell;
//注册一个用作新单元格的类
- (void)registerClassForCells:(Class)cellClass;

@end
