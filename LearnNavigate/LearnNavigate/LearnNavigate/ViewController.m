//
//  ViewController.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/14.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

- (void)initUI
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.title = @"UINavigationBar使用总结";
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
//    [self initNavView];
    [self initView];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)initNavView
{
    self.title = @"导航条";
    self.navigationItem.title = @"导航条2";
    
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.leftBarButtonItem = barButton;
    
    
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    //设置导航条背景颜色，也是半透明玻璃状的颜色效果
    self.navigationController.navigationBar.backgroundColor=[UIColor orangeColor];
    //可以用self.navigationController.navigationBar.frame.size获得高宽，还有self.navigationController.navigationBar.frame.origin获得x和y
    //高44，宽375，如果是Retina屏幕，那么宽和高@2x即可分别是750和88
    //x是0很明显，y是20，其中上面20就是留给状态栏的高度
    NSLog(@"%f",self.navigationController.navigationBar.frame.origin.y);
    
    //隐藏导航条，由此点击进入其他视图时导航条也会被隐藏，默认是NO
    //以下一个直接给navigationBarHidden赋值，一个调用方法，都是一样的，下面一个多了一个动画选项而已
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //给导航条增加背景图片，其中forBarMetrics有点类似于按钮的for state状态，即什么状态下显示
    //UIBarMetricsDefault-竖屏横屏都有，横屏导航条变宽，则自动repeat图片
    //UIBarMetricsCompact-竖屏没有，横屏有，相当于之前老iOS版本里地UIBarMetricsLandscapePhone
    //UIBarMetricsCompactPrompt和UIBarMetricsDefaultPrompt暂时不知道用处，官方解释是Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar，以后遇到时再细说
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"big2.png"] forBarMetrics:UIBarMetricsDefault];
    //如果图片太大会向上扩展侵占状态栏的位置，在状态栏下方显示
    //clipsToBounds就是把多余的图片裁剪掉
    self.navigationController.navigationBar.clipsToBounds=YES;
}

- (void)initView
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 60, 100, 100)];
    [view1 setBackgroundColor:[UIColor yellowColor]];
    
    [self.view addSubview:view1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
