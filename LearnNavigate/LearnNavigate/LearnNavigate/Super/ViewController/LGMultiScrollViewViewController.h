//
//  LGMultiScrollViewViewController.h
//  shop
//
//  Created by 唐开福 on 16/11/5.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGViewController.h"
#import "LGHeaderMenuView.h"
#import "LGScollViewViewModel.h"
@protocol LGMultiScrollViewViewControllerProtocol <NSObject>
@property (nonatomic, strong) NSArray <__kindof LGScollViewViewModel *> *scrollViewViewModels;

@end


@interface LGMultiScrollViewViewController : LGViewController<UITableViewDelegate, UITableViewDataSource, LGMultiScrollViewViewControllerProtocol>
@property (nonatomic, strong, readonly) UIScrollView *currentScrollView;
@property (nonatomic, strong, readonly) LGScollViewViewModel *currentScrollViewModel;
@property (nonatomic, strong) LGHeaderMenuView *headerMenuView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) NSArray <__kindof UIScrollView *>*scrollViews; // 可以重写这个get方法,自定义tableView,默认都是LGTableview


- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithScrollViewTitles:(NSArray <NSString *>*)titles;
- (instancetype)initWithScrollViewTitles:(NSArray <NSString *>*)titles withSelctedIndex:(NSInteger)selectedIndex;

/**
 子类必须要实现这个方法， 返回一个viewModel数组
 */
- (NSArray <__kindof LGScollViewViewModel *> *)viewModelArrayOfScrollViews:(NSArray <__kindof UIScrollView *> *)scrollViews;


/**
 子类可以根据需要重写这个方法

 @param scrollView          当前显示的scrollView
 @param scrollViewViewModel 当前显示的scrollViewViewModel
 @param index               当前是第几个
 */
- (void)currentScrollViewDidChange:(UIScrollView *)scrollView currentScrollViewModel:(LGScollViewViewModel*)scrollViewViewModel index:(NSInteger)index;


- (__kindof LGScollViewViewModel *)scrollViewViewModelOfScrollView:(__kindof UIScrollView *)scrollView;
@end
