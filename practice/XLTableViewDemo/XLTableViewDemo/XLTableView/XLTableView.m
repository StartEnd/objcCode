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
    NSMutableDictionary *_cachedHeight;
}

//@synthesize delegate = _delegate;
@dynamic delegate;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        _cachedCells = [[NSMutableDictionary alloc] init];
        _reusableCells = [[NSMutableSet alloc] init];
        _cachedHeight = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (void)layoutSubviews {
    //cell的布局在这里
    [self layoutTableView];
    
    [super layoutSubviews];

}

- (void)reloadData {
    //清空缓存,重新加载
    [[_cachedCells allValues] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_reusableCells makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_reusableCells removeAllObjects];
    [_cachedCells removeAllObjects];
    [_cachedHeight removeAllObjects];

    [self setNeedsDisplay];
    [self layoutIfNeeded];
}

- (void)layoutTableView {

    const CGSize boundsSize = self.bounds.size;

    // 获取偏移距离
    const CGFloat contentOffset = self.contentOffset.y;

    // 获取当前的可见bounds，其实就是self.bounds
    const CGRect visibleBounds = CGRectMake(0, contentOffset, boundsSize.width, boundsSize.height);

    //cell的个数
    NSInteger numberOfRows = [self.dataSource numberOfRowsInTableView:self];

    // copy old 可见的视图
    NSMutableDictionary *availableCells = [_cachedCells mutableCopy];
    [_cachedCells removeAllObjects];

    // 重新布局显示内容
    //从哪一个cell开始布局哪？,从开始遍历，判断条件合适的

    // 记录当前 Cell 的 origin.y
    CGFloat cellOriginY = 0.0;
    CGFloat cellWidth = boundsSize.width;
    CGFloat cellOriginX = 0.0;

    for (NSInteger row=0; row<numberOfRows; row++){
       // CGRect cellRect = [self rectForRowAtIndex:row];
       // 获取当前 cell 的高度
       //1. 是否缓存了高度
       CGFloat cellHeight = 0.0;
       if([_cachedHeight objectForKey:@(row)]) {
            cellHeight = [_cachedHeight[@(row)] floatValue];
       } else{
           //2. 若没有缓存,是否实现了代理,没有实现代理用默认值
           if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndex:)]) {
               cellHeight = [self.delegate tableView:self heightForRowAtIndex:row];
           } else {
               cellHeight = _UITableViewDefaultRowHeight;
           }
           _cachedHeight[@(row)] =  @(cellHeight);
       }

       CGRect cellRect = CGRectMake(cellOriginX, cellOriginY, cellWidth, cellHeight);
       cellOriginY += cellHeight;
        //cellRect在屏幕上且高度大于0
        if(CGRectIntersectsRect(visibleBounds, cellRect) && cellRect.size.height > 0) {
            // 添加 cell 到 view 上
            XLTableViewCell *cell = ((XLTableViewCell *)[availableCells objectForKey:@(row)]) ?:[self.dataSource
                    tableView:self
                    cellForRowAtIndex:row];
            if(cell) {
                _cachedCells[@(row)] = cell;
                [availableCells removeObjectForKey:@(row)];
                cell.frame = cellRect;
                [self addSubview:cell];
            }
        }
    }

    // 从 availableCell 中移除旧视图

    NSArray *keys = availableCells.allKeys;
     for(NSNumber *key in keys){
         XLTableViewCell *cell = availableCells[key];
         [_reusableCells addObject:cell];
         [cell removeFromSuperview];
     }

    //设置 ContentSize

    NSArray *heights = _cachedHeight.allValues;
    CGFloat  avgHeight = [[heights valueForKeyPath:@"@avg.floatValue"] floatValue];
    CGFloat  contentHeight = numberOfRows  * avgHeight;
    self.contentSize = CGSizeMake(self.bounds.size.width, contentHeight);

}

- (XLTableViewCell *)dequeueReuseableCell {
    XLTableViewCell *cell = [_reusableCells anyObject];
    if(cell) {
        [_reusableCells removeObject:cell];
    }
    return cell;
}

- (CGRect)rectForRowAtIndex:(NSInteger)index {
    const CGRect boundsSize = self.bounds;
    const CGFloat contentOffset = self.contentOffset.y;
    const CGRect visibleRect = CGRectMake(0, contentOffset, self.bounds.size.width, self.bounds.size.height);



    return CGRectZero;
}

@end
