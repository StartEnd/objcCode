//
//  XLTableView.m
//  XLTableViewDemo
//
//  Created by Mr.Song on 2018/8/8.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "XLTableView.h"
#import "XLTableViewCell.h"

//Cell的默认高度
const CGFloat _UITableViewDefaultRowHeight = 43;

@implementation XLTableView {
    NSMutableDictionary *_cachedCells;
    NSMutableSet *_reusableCells;
}

@synthesize delegate = _delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {

    }
    return self;
}


- (void)layoutSubviews {
    //cell的布局在这里
    [self layoutTableView];
    
    [super layoutSubviews];

}

- (void)layoutTableView {

    const CGSize boundsSize = self.bounds.size;
    const CGFloat contentOffset = self.contentOffset.y;
    const CGRect visibleBounds = CGRectMake(0, contentOffset, boundsSize.width, boundsSize.height);

    //cell的个数
    NSInteger cellCount = [self.dataSource numberOfRowsInTableView:self];

    //根据默认计算出contentView的预算高度

    CGFloat  contentHeight = cellCount  * _UITableViewDefaultRowHeight;

    self.contentSize = CGSizeMake(self.bounds.size.width, contentHeight);

    NSEnumerator *enumerator = [_cachedCells keyEnumerator];

    //先删除不可见的cell
    for (NSString *key in enumerator) {
        XLTableViewCell *cell = _cachedCells[key];

        //判断cell与frame是否有交集
        if(!CGRectContainsRect(self.frame, cell.frame)) {
            [_cachedCells removeObjectForKey:key];
            [_reusableCells addObject:cell];
        }
    }

    // 重新布局显示内容



}

- (CGRect)rectForRowAtIndex:(NSInteger)index {
    return CGRectZero;
}

@end
