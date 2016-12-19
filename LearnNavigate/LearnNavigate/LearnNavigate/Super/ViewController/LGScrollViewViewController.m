//
//  LGScrollViewViewController.m
//  shop
//
//  Created by 唐开福 on 16/10/29.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGScrollViewViewController.h"
@interface LGScrollViewViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *currentScrollView;

@end

@implementation LGScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc{
    NSLog(@"%@-------deallocc", NSStringFromClass([self class]));
}
@end
