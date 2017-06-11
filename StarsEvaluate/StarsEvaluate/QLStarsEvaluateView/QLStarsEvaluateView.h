//
//  QLStarsEvaluateView.h
//  StarsEvaluate
//
//  Created by 黄跃奇 on 17/6/11.
//  Copyright © 2017年 yueqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLStarsEvaluateView : UIView

@property (nonatomic, copy) void (^starsButtonBlock)(NSString *score);

@end
