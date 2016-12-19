//
//  SuperTableViewController.h
//  SuperMVVM
//
//  Created by 唐开福 on 16/8/27.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGViewController.h"
#import "LGTableViewCell.h"
#import "LGTableView.h"
#import "LGTableViewViewModel.h"
#import "LGScrollViewViewController.h"


@interface LGTableViewController :LGScrollViewViewController  <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) __kindof LGTableView *tableView ;
@property (nonatomic, strong) LGTableViewViewModel *tableViewViewModel;

@property (nonatomic, copy) void(^cellScollToDelete)(NSIndexPath *); // 只要设置了这个属性就可以左滑删除
- (__kindof LGTableViewViewModel*)tableViewViewModelOfViewController;
@end


