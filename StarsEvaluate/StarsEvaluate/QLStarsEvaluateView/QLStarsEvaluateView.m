//
//  QLStarsEvaluateView.m
//  StarsEvaluate
//
//  Created by 黄跃奇 on 17/6/11.
//  Copyright © 2017年 yueqi. All rights reserved.
//

#import "QLStarsEvaluateView.h"

@interface QLStarsEvaluateView ()

@property (nonatomic, strong) NSMutableArray *starsArray;  //存储所有星星按钮
@property (nonatomic, copy) NSString *score;

@end

@implementation QLStarsEvaluateView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat starsHeight = frame.size.height;
        CGFloat starsWidth = starsHeight;
        CGFloat starsMargin = (frame.size.width - starsWidth * 5) / 4;
        for (NSInteger i = 0; i < 5; i++) {
            UIButton *starsButton = [UIButton buttonWithType:UIButtonTypeCustom];
            starsButton.tag = i + 1;
            starsButton.frame = CGRectMake((starsWidth + starsMargin) * i, 0, starsWidth, starsHeight);
            [starsButton setBackgroundImage:[UIImage imageNamed:@"ico_startgray"] forState:UIControlStateNormal];
            [starsButton setBackgroundImage:[UIImage imageNamed:@"ico_startyellow"] forState:UIControlStateSelected];
            [starsButton addTarget:self action:@selector(clickStarsButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:starsButton];
            [self.starsArray addObject:starsButton];
        }
    }
    return self;
}

//星星按钮点击事件
- (void)clickStarsButtonAction:(UIButton *)sender {
    
    self.score = [NSString stringWithFormat:@"%ld", sender.tag];
    
    if (self.starsButtonBlock) {
        self.starsButtonBlock([NSString stringWithFormat:@"%ld", sender.tag]);
    }
}

- (void)setScore:(NSString *)score {
    _score = score;
    
    NSInteger starsNum = [self.score integerValue];
    
    for (NSInteger i = 0; i < starsNum; i++) {
        UIButton *fullButton = self.starsArray[i];
        [fullButton setBackgroundImage:[UIImage imageNamed:@"ico_startyellow"] forState:UIControlStateNormal];
    }
    for (NSInteger i = starsNum; i < self.starsArray.count; i ++) {
        
        UIButton *nullButton = self.starsArray[i];
        [nullButton setBackgroundImage:[UIImage imageNamed:@"ico_startgray"] forState:UIControlStateNormal];
    }
}

- (NSMutableArray *)starsArray {
    
    if (!_starsArray) {
        _starsArray = [NSMutableArray array];
    }
    return _starsArray;
}


@end
