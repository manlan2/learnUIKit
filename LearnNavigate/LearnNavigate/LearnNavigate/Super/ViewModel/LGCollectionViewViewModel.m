//
//  LVCollecitonViewViewModel.m
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGCollectionViewViewModel.h"
#import "LGCollectionView.h"
@implementation LGCollectionViewViewModel

- (instancetype)initWithCollectView:(LGCollectionView *)collectView{
    return [self initWithScrollView:collectView haveRefreshView:YES haveLoadMoreView:YES];
}

- (instancetype)initWithCollectView:(LGCollectionView *)collectView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView{
    self = [super initWithScrollView:collectView haveRefreshView:refreshView haveLoadMoreView:loadMoreView];
    if(self){
        _collectView = collectView;
    }
    return self;
}
@end
