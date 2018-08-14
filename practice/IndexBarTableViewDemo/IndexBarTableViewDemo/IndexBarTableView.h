//
//  IndexBarTableView.h
//  IndexBarTableViewDemo
//
//  Created by Mr.Song on 2018/8/9.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IndexBarTableView;
@class ViewReusePool;

@protocol IndexBarTableViewDelegate<NSObject>

- (NSArray<NSString *> *)indexTitlesForIndexBarView:(IndexBarTableView *)indexBarView;

@optional

@end


@interface IndexBarTableView : UITableView

@property(nonatomic, assign) id<IndexBarTableViewDelegate> indexDelegate;

@end
