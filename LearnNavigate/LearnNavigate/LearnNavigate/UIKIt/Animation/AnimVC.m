//
// Created by wanhongbin on 17/1/10.
// Copyright (c) 2017 wanhongbin. All rights reserved.
//

#import "AnimVC.h"
#import "redpackerViewController.h"

@implementation AnimVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initAnimtion];
    
    //    [self initAnimtion2];
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
    self.imageView.animationDuration    = 2.f;
    
    // 设置图片
    [self.imageView startAnimating];
    [self performSelector:@selector(animationFinish) withObject:nil afterDelay:self.imageView.animationDuration + 1.f];
}

- (void)animationFinish {
    NSLog(@"动画播放完了");
    [self debugView];
    // 红包视图
    UIView *redpackXibView = [[[NSBundle mainBundle] loadNibNamed:@"AnimVC2" owner:nil options:nil] firstObject];
    redpackXibView.frame = self.view.bounds;
    if(redpackXibView == nil) {
        return;
    }

    //按钮viewWithTag: 1 关闭 2 查看
    
    UIButton *closeButton = (UIButton *)[redpackXibView viewWithTag:2];
    [closeButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redpackXibView];
    [redpackXibView setTag:10];
    
    // 旋转
    UIImageView *lightImageView = [self.view viewWithTag:3];
    [self rotate360DegreeWithImageView:lightImageView];
}

- (void)closeView {
    NSLog(@"closeView");
    
    UIView *redpackerView = [self.view viewWithTag:10];
    [redpackerView removeFromSuperview];
}

- (void)pushRedVC {
    // 播放红包按钮
    redpackerViewController *redVc = [[redpackerViewController alloc] init];
    [self.navigationController pushViewController:redVc animated:YES];
}

- (void)debugView {
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view1 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view1];
}

// 图片旋转360度
- (UIImageView *)rotate360DegreeWithImageView:(UIImageView *)imageView{
    CABasicAnimation *animation = [ CABasicAnimation
        animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];

    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:

        CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 0.5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 1000;

    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [imageView.layer addAnimation:animation forKey:nil];
    return imageView;
}

@end
