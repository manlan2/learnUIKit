//
// Created by wanhongbin on 17/1/10.
// Copyright (c) 2017 wanhongbin. All rights reserved.
//

#import "AnimVC.h"

@implementation AnimVC

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];

    [self initAnimtion3];
}

- (void)initAnimtion3 {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    // 给图片控件添加图片对象
    [imageView setImage:[UIImage imageNamed:@"image_00000"]];
    //图片控件添加到视图上面去
    [self.view addSubview:imageView];

    //创建一个可变数组
    NSMutableArray *ary = [NSMutableArray new];
    for(int i = 0; i <= 9; i ++) {

        //通过for 循环,把我所有的 图片存到数组里面
        NSString *imageName = [NSString stringWithFormat:@"image_0000%d", i];
        NSLog(@"%@", imageName);

        UIImage  *image     = [UIImage imageNamed:imageName];
        [ary addObject:image];
    }

    // 设置图片的序列帧 图片数组
    imageView.animationImages = ary;
    //动画重复次数
    imageView.animationRepeatCount = 0;
    //动画执行时间,多长时间执行完动画
    imageView.animationDuration    = 0.20;
    //开始动画
    [imageView startAnimating];
}

- (void)initAnimtion2 {
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 0; i <= 34; i++)
    {
        NSString * str;
        if(10 > i)
        {
            str = [NSString stringWithFormat:@"0%zd",i];
        }
        else {
            str = [NSString stringWithFormat:@"%zd",i];
        }

        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_000%@",str]];
        [images addObject:image];
    }
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
    [self.animationImageView initWithFrame:CGRectMake(0, 64, 131, 125)];
    self.animationImageView.animationImages      = imagesArray;//将序列帧数组赋给UIImageView的animationImages属性
    self.animationImageView.animationDuration    = 3.f;//设置动画时间
    self.animationImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
    [self.animationImageView startAnimating];//开始播放动画

    [self.view addSubview:self.animationImageView];

    NSTimer *myAnimatedTimer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(setNextImage) userInfo:nil repeats:YES];
}

- (void)setNextImage {
//    NSString *imageString = [NSString stringWithFormat:@"image%i.png", nextImage];
//    self.animationImageView.image = [[UIImage imageNamed:imageString];
    NSLog(@"setNextImage");
}

@end
