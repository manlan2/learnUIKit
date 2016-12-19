//
//  LGScollViewViewModel.h
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGEnumeration.h"
#import "LGViewModel.h"
@protocol LGViewModelProtocol <NSObject>

@end

@interface LGScollViewViewModel : LGViewModel
@property (nonatomic, assign, readonly) NSInteger       currentPage;   // 当前加载到第几页
@property (nonatomic, strong, readonly) NSMutableArray *listDataArray; // 加载到的数据
@property (nonatomic, weak  , readonly) UIScrollView   *scrollView;
@property (nonatomic, strong, readonly) NSMutableSet *showIndexes;

@property (nonatomic, assign) BOOL      reloading;          // 是否正在加载
@property (nonatomic, assign) NSInteger pageSizeCount;      // 每一页的加载的数据量


- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithScrollView:(__kindof UIScrollView *)scrollView; // 创建一个ViewModel
- (instancetype)initWithScrollView:(__kindof UIScrollView *)scrollView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView;

- (void)reloadData; // 刷新
- (void)reloadDataShowRefreshView:(BOOL)show; // 刷新是否显示下拉的控件


/**
 子类必须重写这个方法来写请求数据
 */
- (void)loadDateWithPage:(NSInteger)page scrollView:(UIScrollView *)scrollView;

@end


