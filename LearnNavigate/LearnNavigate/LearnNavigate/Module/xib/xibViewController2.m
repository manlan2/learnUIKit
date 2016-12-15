//
//  xibViewController2.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/15.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "xibViewController2.h"

@interface xibViewController2 ()

@end

@implementation xibViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadviewFromXib];
}

- (void)loadviewFromXib
{
    UIView *vc = [[NSBundle mainBundle]loadNibNamed:@"2view" owner:nil options:nil].lastObject;
    [vc setFrame:CGRectMake(0, 0, 100, 200)];
    [vc setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
