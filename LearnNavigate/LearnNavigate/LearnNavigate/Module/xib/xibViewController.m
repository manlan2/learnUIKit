//
//  xibViewController.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/15.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

/*
 1. view contrl从xib加载view的
 2. 
 */

#import "xibViewController.h"

@interface xibViewController ()

@end

@implementation xibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView
{
   NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"xibViewController" owner:nil options:nil];
    
    UIView *plainView = [nibArr lastObject];
    [self.view addSubview:plainView];
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
