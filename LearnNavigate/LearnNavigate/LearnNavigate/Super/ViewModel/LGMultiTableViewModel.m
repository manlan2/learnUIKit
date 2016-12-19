//
//  LGMultiTableViewModel.m
//  shop
//
//  Created by 唐开福 on 16/9/24.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGMultiTableViewModel.h"
#import "LGScollViewViewModel.h"

@interface LGMultiScrollViewViewViewModel()
@property (nonatomic, strong) LGScollViewViewModel *currentscrollViewViewModel;
@property (nonatomic, strong) UIScrollView *currentscrollView;
@property (nonatomic, strong) NSArray<UIScrollView *> *
scrollViewViews;
@property (nonatomic, strong) NSArray<LGScollViewViewModel *> *scrollViewViewViewModels;
@end


@implementation LGMultiScrollViewViewViewModel

- (instancetype)initWithScrollViews:(NSArray <UIScrollView *>*)scrollViews scrollViewViewModel:(NSArray<__kindof LGScollViewViewModel *>*)scrollViewViewModels{
        NSAssert(YES, @"scrollViews的个数必须要与scrollViewViewModel个数一致");
    if(self = [super init]){
        self.currentscrollView = scrollViews.firstObject;
        self.scrollViewViews = scrollViews;
        self.scrollViewViewViewModels = scrollViewViewModels;
    }
    return self;
}

// 会自动创建自己的viewModel
- (instancetype)initWithScrollViews:(NSArray <UIScrollView *>*)scrollViews{
    self = [super init];
    if(self){
        [scrollViews enumerateObjectsUsingBlock:^(UIScrollView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.tag = idx;
        }];
    }
    return self;
}

- (void)changeCurrentscrollerViewView:(UIScrollView *)scrollViewView{
    if(scrollViewView == nil){
        return;
    }
    self.currentscrollView = scrollViewView;
}



@end


