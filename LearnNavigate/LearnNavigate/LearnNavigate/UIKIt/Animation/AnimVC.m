//
// Created by wanhongbin on 17/1/10.
// Copyright (c) 2017 wanhongbin. All rights reserved.
//

#import "AnimVC.h"

@implementation AnimVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self initAnimtion];
}

- (void)initAnimtion {

    NSArray *imagesArray
                = [NSArray arrayWithObjects:
            [UIImage imageNamed:@"image_00000.png"],
                [UIImage imageNamed:@"image_00001.png"],
                [UIImage imageNamed:@"image_00002.png"],
                [UIImage imageNamed:@"image_00003.png"],
                [UIImage imageNamed:@"image_00004.png"],
                [UIImage imageNamed:@"image_00005.png"],
                [UIImage imageNamed:@"image_00006.png"],
                [UIImage imageNamed:@"image_00007.png"],
                [UIImage imageNamed:@"image_00008.png"],
                [UIImage imageNamed:@"image_00009.png"],
                [UIImage imageNamed:@"image_000010.png"],
                [UIImage imageNamed:@"image_000011.png"],
                [UIImage imageNamed:@"image_000012.png"],
                [UIImage imageNamed:@"image_000013.png"],
                [UIImage imageNamed:@"image_000014.png"],
                [UIImage imageNamed:@"image_000015.png"],
                [UIImage imageNamed:@"image_000016.png"],
                [UIImage imageNamed:@"image_000017.png"],
                [UIImage imageNamed:@"image_000018.png"],
                [UIImage imageNamed:@"image_000019.png"],
                [UIImage imageNamed:@"image_000020.png"],
                [UIImage imageNamed:@"image_000021.png"],
                [UIImage imageNamed:@"image_000022.png"],
                [UIImage imageNamed:@"image_000023.png"],
                [UIImage imageNamed:@"image_000024.png"],
                nil];

    self.animationImageView = [[UIImageView alloc] init];
    [self.animationImageView initWithFrame:CGRectMake(0, 0, 131, 125)];
    self.animationImageView.animationImages      = imagesArray;//将序列帧数组赋给UIImageView的animationImages属性
    self.animationImageView.animationDuration    = 3.f;//设置动画时间
    self.animationImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
    [self.animationImageView startAnimating];//开始播放动画

    NSTimer *myAnimatedTimer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(setNextImage) userInfo:nil repeats:YES];
}

- (void)setNextImage {
//    NSString *imageString = [NSString stringWithFormat:@"image%i.png", nextImage];
//    self.animationImageView.image = [[UIImage imageNamed:imageString];
    NSLog(@"setNextImage");
}

@end
