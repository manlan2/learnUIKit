//
//  LGTableViewViewModel.m
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGTableViewViewModel.h"
#import "MJRefresh.h"
#import "LGTableView.h"
#import "LGNetworkManager.h"
#import <MJExtension.h>
#import "LGScollViewViewModel+RequestStatus.h"
@implementation LGTableViewViewModel


- (instancetype)initWithtableView:(LGTableView *)tableView;{
    return  [self initWithtableView:tableView haveRefreshView:YES haveLoadMoreView:YES];
}
- (instancetype)initWithtableView:(LGTableView *)tableView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView{
    self = [super initWithScrollView:tableView haveRefreshView:refreshView haveLoadMoreView:loadMoreView];
    if(self){
        _tableView = tableView;
        _parameterDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)loadDateWithPage:(NSInteger)page scrollView:(UIScrollView *)scrollView {
    
    WS(weakSelf)
    NSString *url = self.URLString;
    if(self.urlappendCurrentPage) {
        url = [self.URLString stringByAppendingFormat:@"&curpage=%zd", page];
    }
    [[LGNetworkManager manager] POST:url parameterInfo:self.parameterDic success:^(NSDictionary *responseObject) {
        
        [weakSelf loadDataSuccess:responseObject];
        
    } failure:^(NSError *error) {
        [self loadDataFailure:nil];
    }];
}


- (void)loadDataSuccess:(NSDictionary *)data {
    
    BOOL hasMore = [data[@"hasmore"] boolValue];
    NSArray *array = [self.dataClass mj_objectArrayWithKeyValuesArray:data[@"datas"]];
    [self lg_requestFinish:array hasMore:hasMore];
}

- (void)loadDataFailure:(LGHTTPError *)error {
    
    [self lg_requestFailureInView:self.tableView];
}
@end
