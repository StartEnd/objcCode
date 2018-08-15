//
//  YFTableViewCell.m
//  CustomTableView
//
//  Created by HO on 2017/5/23.
//  Copyright © 2017年 HO. All rights reserved.
//

#import "YFTableViewCell.h"

@implementation YFTableViewCell{
    CAGradientLayer * _gradientLayer;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(id)[[ UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
                                  (id)[[ UIColor colorWithWhite:1.0f alpha:0.1f] CGColor],
                                  (id)[[ UIColor clearColor] CGColor],
                                  (id)[[ UIColor colorWithWhite:0.0f alpha:0.1f] CGColor]];
        _gradientLayer.locations = @[@0.00f,@0.01f,@0.95f,@1.00f];
        [self.layer insertSublayer:_gradientLayer above:0];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
