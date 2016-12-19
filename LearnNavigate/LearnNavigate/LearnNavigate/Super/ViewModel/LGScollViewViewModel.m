//
//  LGScollViewViewModel.m
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGScollViewViewModel.h"
#import "UIScrollView+ViewModel.h"
#import "LGRefreshHeader.h"
#import "MJRefreshAutoNormalFooter.h"
@interface LGScollViewViewModel()
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSMutableArray *listDataArray;
@property (nonatomic, strong) NSMutableSet *showIndexes;
@property (nonatomic, weak  ) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL haveRefreshView;
@property (nonatomic, assign) BOOL haveLoadMoreView;

@end

@implementation LGScollViewViewModel
- (instancetype)initWithScrollView:(UIScrollView *)scrollView{
    return [self initWithScrollView:scrollView haveRefreshView:YES haveLoadMoreView:YES];
}

- (instancetype)initWithScrollView:(UIScrollView *)scrollView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView{
    self = [super init];
    if(self){
        self.currentPage = 0;
        self.pageSizeCount = 10;
        self.listDataArray = [NSMutableArray array];
        self.scrollView = scrollView;
        [self.scrollView setViewModel:self];

        self.haveRefreshView = refreshView;
        self.haveLoadMoreView = loadMoreView;
        WS(weakSelf)
        if(refreshView){
            scrollView.mj_header = [LGRefreshHeader headerWithRefreshingBlock:^{
                [weakSelf reloadData];
            }];
        }
        if(loadMoreView){
            scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                weakSelf.currentPage ++;
                [weakSelf loadDateWithPage:weakSelf.currentPage scrollView:scrollView];
            }];
            scrollView.mj_footer.automaticallyHidden = YES;
        }
        self.showIndexes = [[NSMutableSet alloc] init];
    }
    return self;
}


- (void)reloadData{
    [self reloadDataShowRefreshView:NO];

}
- (void)reloadDataShowRefreshView:(BOOL)show{
    if(self.reloading){
        return;
    }
    self.reloading = YES;
    if(show && self.haveRefreshView){
        [self.scrollView.mj_header beginRefreshing];
    }
    self.currentPage = 1;
    [self.showIndexes removeAllObjects];
    [self loadDateWithPage:self.currentPage scrollView:self.scrollView];

}
- (void)loadDateWithPage:(NSInteger)page scrollView:(UIScrollView *)scrollView{
}

#if DEBUG
- (void)dealloc{
    NSLog(@"%@-----dealloc", NSStringFromClass([self class]));
}
#endif

@end



