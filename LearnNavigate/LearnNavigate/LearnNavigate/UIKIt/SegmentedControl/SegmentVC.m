//
//  SegmentVC.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/21.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "SegmentVC.h"

@interface SegmentVC ()

@property (nonatomic, strong) UISegmentedControl *segCtl;

@end

@implementation SegmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    [self initNavTitleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)initUI
{
    [self.view setBackgroundColor:[UIColor yellowColor]];
}

- (void)initNavTitleView
{
    NSArray *segArray = [[NSArray alloc]initWithObjects:@"商家",@"账号中心", nil];
    
    self.segCtl = [[UISegmentedControl alloc]initWithItems:segArray];
    self.segCtl.frame = CGRectMake(0, 0, 200, 30);
    self.segCtl.selectedSegmentIndex = 0;
    
//    self.segCtl.tintColor = [UIColor whiteColor];
    
    [self.segCtl addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = self.segCtl;
}

//- (void)segAction: (id)sender
- (void)segAction: (UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    
    if (index ==0) {
//        [vc1];
        NSLog(@" vc1");
    }else{
//        [vc2];
        NSLog(@" vc2");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
