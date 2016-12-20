//
//  LGMultiScrollViewViewController.m
//  shop
//
//  Created by 唐开福 on 16/11/5.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGMultiScrollViewViewController.h"
#import "LGScollViewViewModel.h"
#import "LGHeaderMenuView.h"
#import <ReactiveCocoa.h>
#import "LGTableView.h"
#import "NSObject+Name.h"
#import "UIView+Loading.h"
@interface LGMultiScrollViewViewController ()
@property (nonatomic, strong) UIScrollView *currentScrollView;
@property (nonatomic, strong) LGScollViewViewModel *currentScrollViewModel;
@property (nonatomic, assign) NSInteger scrollViewCount;
@property (nonatomic, assign) NSInteger defaultIndex;

@end

@implementation LGMultiScrollViewViewController
@synthesize scrollViewViewModels = _scrollViewViewModels;


- (instancetype)initWithScrollViewTitles:(NSArray <NSString *>*)titles{
    return [self initWithScrollViewTitles:titles withSelctedIndex:0];
}

- (instancetype)initWithScrollViewTitles:(NSArray <NSString *>*)titles withSelctedIndex:(NSInteger)selectedIndex
{
    self = [super init];
    if(self)
    {
        self.defaultIndex = selectedIndex;
        self.titles = titles;
        self.scrollViewCount = self.titles.count;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.mainScrollView];
    self.scrollViewViewModels = [self viewModelArrayOfScrollViews:self.scrollViews];
    [self.view addSubview:self.headerMenuView];

    WS(weakSelf)
    [self.headerMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(40);
    }];
    [self.scrollViews enumerateObjectsUsingBlock:^(__kindof UIScrollView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.left = idx  * weakSelf.mainScrollView.width;
        [weakSelf.mainScrollView addSubview:obj];
    }];
    @weakify(self)
    [RACObserve(self.mainScrollView, contentOffset) subscribeNext:^(id x) {
        @strongify(self)
        CGPoint contentOffset = [x CGPointValue];
        int index =  (int)(contentOffset.x / self.mainScrollView.width);
        if(self.currentScrollView != self.scrollViews[index]){
            self.currentScrollView = self.scrollViews[index];
            self.currentScrollViewModel = self.scrollViewViewModels[index];
            [self currentScrollViewDidChange:self.currentScrollView currentScrollViewModel:self.currentScrollViewModel index:index];
        }

    }];
    [self.view layoutIfNeeded];
    [_headerMenuView setLineBottomMargin:0];
    [self.headerMenuView selectAnimationWithIndex:self.defaultIndex withScrollView:self.mainScrollView];
    
    

}


- (LGHeaderMenuView *)headerMenuView
{
    if (!_headerMenuView) {
        
        _headerMenuView = [[LGHeaderMenuView alloc] initWithTitles:self.titles];
        [_headerMenuView setButtonMargin:0];
        [_headerMenuView setLineBottomMargin:0];
        [_headerMenuView setContentScrollView:self.mainScrollView];
        [_headerMenuView setMenuPressedButtonBlock:^(LGHeaderMenuView *headerView, NSInteger index){
        }];
    }
    
    return _headerMenuView;
}

- (UIScrollView *)mainScrollView{
    if(_mainScrollView == nil){

        _mainScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _mainScrollView.backgroundColor = UIColorWithHex(0xEFEFF4);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.contentSize = CGSizeMake(_mainScrollView.width * self.scrollViewCount, _mainScrollView.height);
        _mainScrollView.bounces = NO;
    }
    return _mainScrollView;
}

- (NSArray<UIScrollView *> *)scrollViews{
    if(_scrollViews == nil){
        NSMutableArray *scrollViews = [NSMutableArray array];
        for (int i = 0 ; i < self.scrollViewCount; i ++) {
            CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            UITableView *tableView = [[LGTableView alloc] initWithFrame:rect style:UITableViewStylePlain];
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.backgroundColor = UIColorWithHex(0xEFEFF4);
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [tableView setShowsVerticalScrollIndicator:NO];
            [tableView setShowsHorizontalScrollIndicator:NO];
            tableView.tag = i;
            // 不知道为什么要加UI_TABBAR_HEIGHT才能显示正常，以后有时间在看一下
            [tableView setContentInset:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT + 40, 0, 0, 0)];
             [tableView setScrollIndicatorInsets:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT + 40, 0, 0, 0)];
            [scrollViews addObject:tableView];
            _scrollViews = scrollViews;
        }
    }
    return  _scrollViews;
}


- (NSArray <__kindof LGScollViewViewModel *> *)viewModelArrayOfScrollViews:(NSArray <__kindof UIScrollView *> *)scrollViews{
    
    NSString *error = [NSString stringWithFormat:@"%@ 必须要实现这个%p方法", [[self class] lg_name], __func__];
    NSAssert(YES, error);
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.currentScrollViewModel.listDataArray.count;
}
- (LGUITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *error = [NSString stringWithFormat:@"%@ 必须重写这个%p方法", [[self class] lg_name], __func__];
    NSAssert(YES, error);
    return nil;
}

- (void)currentScrollViewDidChange:(UIScrollView *)scrollView currentScrollViewModel:(LGScollViewViewModel*)scrollViewViewModel index:(NSInteger)index{
    
    if(scrollViewViewModel.currentPage == 0){
        [scrollView lg_showLoadingAnimationView];
        [scrollViewViewModel reloadData];
    }
}


// MARK: 辅助方法
- (LGScollViewViewModel *)scrollViewViewModelOfScrollView:(__kindof UIScrollView *)scrollView{
    NSInteger index = [self.scrollViews indexOfObject:scrollView];
    return self.scrollViewViewModels[index];
}

@end
