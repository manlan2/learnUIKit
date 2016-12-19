//
//  LGCollectionViewController.h
//  shop
//
//  Created by 唐开福 on 16/9/27.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGViewController.h"
#import "LGCollectionView.h"
#import "LGCollectionViewViewModel.h"
#import "LGScrollViewViewController.h"
@protocol LGScrollerViewViewModelProtocol <NSObject>
@property (nonatomic, strong) LGScollViewViewModel *collectionViewModel;
@end


@interface LGCollectionViewController : LGScrollViewViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,LGScrollerViewViewModelProtocol>
@property (nonatomic, strong) LGCollectionView *collectionView; // 子类可以重写collection的get方法，自定义collectionView
- (__kindof LGCollectionViewViewModel*)collectionViewModelOfViewController;

@end

