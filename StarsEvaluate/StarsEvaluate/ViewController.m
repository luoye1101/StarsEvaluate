//
//  ViewController.m
//  StarsEvaluate
//
//  Created by 黄跃奇 on 17/6/11.
//  Copyright © 2017年 yueqi. All rights reserved.
//

#import "ViewController.h"
#import "QLStarsEvaluateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

#pragma mark - 设置UI界面
- (void)setupUI {
    
    CGFloat width = 150;
    QLStarsEvaluateView *starEvaluateView = [[QLStarsEvaluateView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - width) * 0.5, 100, width, 25)];
    starEvaluateView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:starEvaluateView];
    
    starEvaluateView.starsButtonBlock = ^ (NSString *score){
        
        NSLog(@"score - %@", score);
    };
}


@end
