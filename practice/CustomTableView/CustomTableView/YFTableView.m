//
//  YFTableView.m
//  CustomTableView
//
//  Created by HO on 2017/5/23.
//  Copyright © 2017年 HO. All rights reserved.
//

#import "YFTableView.h"
#import "YFTableViewCell.h"

@implementation YFTableView{
    //可复用的一组单元格
    NSMutableSet * _reuseCells;
    //表示单元格类型的类
    Class _cellClass;
}

//初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        _reuseCells = [[NSMutableSet alloc] init];
    }
    return self;
}

//更新布局
- (void)layoutSubviews{
    [super layoutSubviews];
    [self refreshView];
}

//固定行高
//const float SHC_ROW_HEIGHT = 50.0f;

- (void)refreshView{
    //设置scrollView的高度
    self.contentSize = CGSizeMake(self.bounds.size.width, [_dataSource numberOfRows] * [self getRowHeight]);
    
    //删除不再可见的细胞
    for (UIView * cell in [self cellSubViews]) {
        //滑出顶部的cell
        if (cell.frame.origin.y + cell.frame.size.height < self.contentOffset.y) {
            [self recycleCell:cell];
        }
        
        //底部没有出现的cell
        if (cell.frame.origin.y > self.contentOffset.y + self.frame.size.height) {
            [self recycleCell:cell];
        }
    }
    
    //确保每一行都有一个单元格
    int firstVisibleIndex = MAX(0, floor(self.contentOffset.y / [self getRowHeight]));
    int lastVisibleIndex = MIN([_dataSource numberOfRows], firstVisibleIndex + 1 + ceil(self.frame.size.height / [self getRowHeight]));
    
    
    //添加cell
    for (int row = firstVisibleIndex; row < lastVisibleIndex; row ++) {
        //获得cell
        UIView * cell = [self cellForRow:row];
        
        if (!cell) {
            //如果cell不存在（没有复用的cell），则创建一个新的cell添加到scrollView中
            UIView * cell = [_dataSource cellForRow:row];
            float topEdgeForRow = row * [self getRowHeight];
            cell.frame = CGRectMake(0, topEdgeForRow, self.frame.size.width, [self getRowHeight]);
            [self insertSubview:cell atIndex:0];
        }
    }
}

//从滚动视图返回一个单元格数组，self子视图时单元格
- (NSArray *)cellSubViews{
    NSMutableArray * cells = [[NSMutableArray alloc] init];
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:[YFTableViewCell class]]) {
            [cells addObject:subView];
        }
    }
    return cells;
}

//通过添加一组复用单元格，并从视图中删除它来循环单元格
- (void)recycleCell:(UIView *)cell{
    [_reuseCells addObject:cell];
    [cell removeFromSuperview];
}

//返回给定的单元格，如果不存在则返回nil
- (UIView *)cellForRow:(NSInteger)row{
    float topEdgeForRow = row * [self getRowHeight];
    for (UIView * cell in [self cellSubViews]) {
        if (cell.frame.origin.y == topEdgeForRow) {
            return cell;
        }
    }
    return nil;
}

- (void)registerClassForCells:(Class)cellClass{
    _cellClass = cellClass;
}

- (UIView *)dequeueReusableCell{
    //首先从复用池获取一个单元格
    UIView * cell = [_reuseCells anyObject];
    if (cell) {
        NSLog(@"从池中返回单元格");
        [_reuseCells removeObject:cell];
    }
    
    if (!cell) {
        NSLog(@"创建新单单元格");
        cell = [[_cellClass alloc] init];
    }
    return cell;
}

//单元格高度
- (CGFloat)getRowHeight{
    CGFloat rowHeight = 50.0f;
    @try {
        if ([self.dataSource rowHeight]) { //自定义的高度
            rowHeight = [self.dataSource rowHeight];
        }
    } @catch (NSException *exception) {//默认高度
        rowHeight = 50.0f;
    } @finally {
        
    }
    return rowHeight;
}


#pragma mark - property setters
- (void)setDataSource:(id<YFTableViewDataSource>)dataSource{
    _dataSource = dataSource;
    [self refreshView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self refreshView];
}


@end
