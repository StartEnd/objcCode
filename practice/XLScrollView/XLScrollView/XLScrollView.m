//
//  XLScrollView.m
//  XLScrollView
//
//  Created by Mr.Song on 2018/8/14.
//  Copyright © 2018 Mr.Song. All rights reserved.
//

#import "XLScrollView.h"

@implementation XLScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
        [self addGestureRecognizer:pan];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_grass"]];
    }
    return self;
}

- (void)move:(UIPanGestureRecognizer *)gesture {
    
    CGPoint translation = [gesture translationInView:self];
    CGRect bounds = self.bounds;
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    
    NSLog(@"%@",NSStringFromCGRect(bounds));
    
    [gesture setTranslation:CGPointZero inView:self];
}



@end
