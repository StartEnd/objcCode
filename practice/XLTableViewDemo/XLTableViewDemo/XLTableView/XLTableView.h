//
//  XLTableView.h
//  XLTableViewDemo
//
//  Created by Mr.Song on 2018/8/8.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLTableView;
@class XLTableViewCell;

@protocol XLTableViewDataSource<NSObject>

@required

//cell的个数
- (NSInteger)numberOfRowsInTableView:(XLTableView *)tableView;

//获取cell
- (XLTableViewCell *)tableView:(XLTableView *)tableView cellForRowAtIndex:(NSInteger)index;

@end

@protocol XLTableViewDelegate<NSObject, UIScrollViewDelegate>


@optional

//cell的高度,有默认值
- (CGFloat)tableView:(XLTableView *)tableView heightForRowAtIndex:(NSInteger)index;


@end


@interface XLTableView : UIScrollView

@property (nonatomic, weak) id<XLTableViewDataSource>   dataSource;
@property (nullable, nonatomic, weak) id<XLTableViewDelegate>     delegate;


@end
