//
//  XLTableViewCell.m
//  XLTableViewDemo
//
//  Created by Mr.Song on 2018/8/8.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "XLTableViewCell.h"

@interface XLTableViewCell()

@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation XLTableViewCell {

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {

}

- (UILabel *)titleLbl {
    if(_titleLbl == nil) {
        _titleLbl = [[UILabel alloc] init];
    }
    return _titleLbl;
}

@end
