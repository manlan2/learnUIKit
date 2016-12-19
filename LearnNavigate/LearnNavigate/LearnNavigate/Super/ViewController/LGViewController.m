//
//  SuperViewController.m
//  SuperMVVM
//
//  Created by 唐开福 on 16/8/27.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGViewController.h"
#import "NSObject+Name.h"
@implementation LGViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

}
#ifdef DEBUG
- (void)dealloc
{
    NSLog(@"%@-----------dealloc", [[self class] lg_name]);
}
#endif
@end
