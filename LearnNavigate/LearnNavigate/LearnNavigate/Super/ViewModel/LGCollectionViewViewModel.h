//
//  LVCollecitonViewViewModel.h
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGViewModel.h"
#import "LGScollViewViewModel.h"
@class LGCollectionView;

@interface LGCollectionViewViewModel : LGScollViewViewModel
@property (nonatomic, weak  , readonly) LGCollectionView *collectView;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCollectView:(LGCollectionView *)collectView; // 创建一个ViewModel
- (instancetype)initWithCollectView:(LGCollectionView *)collectView haveRefreshView:(BOOL)refreshView haveLoadMoreView:(BOOL)loadMoreView;

@end
