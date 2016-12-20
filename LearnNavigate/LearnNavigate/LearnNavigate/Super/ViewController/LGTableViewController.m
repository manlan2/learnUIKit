//
//  SuperTableViewController.m
//  SuperMVVM
//
//  Created by 唐开福 on 16/8/27.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGTableViewController.h"
#import "LGTableViewViewModel.h"
@interface LGTableViewController()

@end

@implementation LGTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableViewViewModel = [self tableViewViewModelOfViewController];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if(self.navigationController.viewControllers.count == 1){
        [self.tableView setContentInset:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, UI_TABBAR_HEIGHT, 0)];
         [self.tableView setScrollIndicatorInsets:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, UI_TABBAR_HEIGHT, 0)];
    }else{
        [self.tableView setContentInset:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, 0, 0)];
        [self.tableView setScrollIndicatorInsets:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, 0, 0)];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if(self.tableView.indexPathForSelectedRow && self.tableView.isEditing == NO){
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }
}


- (LGTableView *)tableView{
    if(_tableView == nil){
        _tableView = [[LGTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColorWithHex(0xf4f4f4);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (__kindof LGTableViewViewModel*)tableViewViewModelOfViewController{
    return nil;
}


#pragma mark - UITabelViewDelegate/UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewViewModel.listDataArray.count;
}
- (LGUITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSAssert(YES, @"子类必须重写这个方法: tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    LGTableViewCell *cell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


// 左滑动删除
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellScollToDelete != nil;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.cellScollToDelete){
        self.cellScollToDelete(indexPath);
    }
}



- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self tableView:tableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
    }];
    return @[deleteAction];
    
}

@end
