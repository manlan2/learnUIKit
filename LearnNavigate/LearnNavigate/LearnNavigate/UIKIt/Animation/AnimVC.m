//
// Created by wanhongbin on 17/1/10.
// Copyright (c) 2017 wanhongbin. All rights reserved.
//

#import "AnimVC.h"

@implementation AnimVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initAnimtion];
}

- (void)initAnimtion {

    self.imageView       = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 198, 155)];
//    [imageView setImage:[UIImage imageNamed:@"image_00000"]];
    self.imageView.image = [UIImage imageNamed:@"image_00000"];
    [self.view addSubview:self.imageView];

    NSMutableArray *ary = [NSMutableArray new];
    for(int        i     = 0; i <= 23; i ++) {
        NSString *imageName;
        if (i < 10) {
            imageName = [NSString stringWithFormat:@"image_0000%d", i];
        } else {
            imageName = [NSString stringWithFormat:@"image_000%d", i];
        }
        UIImage *image = [UIImage imageNamed:imageName];
        [ary addObject:image];
    }

    self.imageView.animationImages      = ary;
    self.imageView.animationRepeatCount = 1;
    self.imageView.animationDuration    = 1.f;

    // 设置图片
    [self.imageView startAnimating];


    [self performSelector:@selector(animationFinish) withObject:nil afterDelay:self.imageView.animationDuration];
}

- (void)animationFinish {
//    self.imageView.image = [UIImage imageNamed:@"image_00024"];
    NSLog(@"动画播放完了");
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view1 setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:view1];
}



@end
