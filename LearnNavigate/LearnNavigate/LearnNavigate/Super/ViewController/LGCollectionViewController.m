//
//  LGCollectionViewController.m
//  shop
//
//  Created by 唐开福 on 16/9/27.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//



#import "LGCollectionViewController.h"
#import "LGCollectionViewViewModel.h"


@implementation LGCollectionViewController

@synthesize collectionViewModel = _collectionViewModel;


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.collectionViewModel = [self collectionViewModelOfViewController];
    if(self.navigationController.viewControllers.count == 1){
        [self.collectionView setContentInset:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, UI_TABBAR_HEIGHT,0)];
        [self.collectionView setScrollIndicatorInsets:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, UI_TABBAR_HEIGHT,0)];
    }else{
        [self.collectionView setContentInset:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, 0, 0)];
        [self.collectionView setScrollIndicatorInsets:UIEdgeInsetsMake(UI_NAVBAR_HEIGHT, 0, 0, 0)];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.collectionView.indexPathsForSelectedItems enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.collectionView deselectItemAtIndexPath:obj animated:YES];
    }];
    
}

- (LGCollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[LGCollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColorWithHex(0xeeeeee);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (__kindof LGCollectionViewViewModel*)collectionViewModelOfViewController{
    NSAssert(YES, @"继承与LGCollectionController的必须要重写collectionViewModelOfViewController方法");
    return nil;

}

#pragma mark - LGTableViewViewModelDelegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionViewModel.listDataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSAssert(YES, @"子类必须重写这个方法: collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath");
    UICollectionViewCell *cell = [[UICollectionViewCell alloc] init];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(LGScreenSize().width / 2, LGScreenHeight() / 2);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self lg_scaleAnimationCell:cell];

}

@end
