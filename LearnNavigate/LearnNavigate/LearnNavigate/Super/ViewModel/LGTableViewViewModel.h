//
//  LGTableViewViewModel.h
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGViewModel.h"
#import "LGScollViewViewModel.h"


@class LGTableView;

@interface LGTableViewViewModel : LGScollViewViewModel

@property (nonatomic, copy  ) NSString            * URLString;
@property (nonatomic, strong) Class                dataClass;
@property (nonatomic, strong) NSMutableDictionary *parameterDic;
@property (nonatomic, assign) BOOL                urlappendCurrentPage;
@property (nonatomic, weak, readonly) LGTableView *tableView;
- (instancetype)initWithtableView:(LGTableView *)tableView; // 创建一个ViewModel
- (instancetype)initWithtableView:(LGTableView *)tableView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView;


/**
 请求数据成功

 @param data 请求到的数据
 */
- (void)loadDataSuccess:(NSDictionary *)data;


/**
 请求数据失败

 @param error 失败
 */
- (void)loadDataFailure:(LGHTTPError *)error;
@end

