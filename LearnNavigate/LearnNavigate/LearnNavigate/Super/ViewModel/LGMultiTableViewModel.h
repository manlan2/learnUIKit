//
//  LGMultiTableViewModel.h
//  shop
//
//  Created by 唐开福 on 16/9/24.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGScollViewViewModel.h"
//#import "LGScrollViewModelProtocol.h"


// 调用requestNextPage 相当于 requestNextpageWithtableView:self.selectedTableView

@interface LGMultiScrollViewViewViewModel : LGViewModel
@property (nonatomic, strong, readonly) UIScrollView *currentscrollView;
@property (nonatomic, strong, readonly) NSArray<UIScrollView *> *
scrollViewViews;
@property (nonatomic, strong, readonly) NSArray<LGScollViewViewModel *> *scrollViewViewViewModels;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithScrollViews:(NSArray <UIScrollView *>*)scrollViews scrollViewViewModel:(NSArray<__kindof LGScollViewViewModel *>*)scrollViewViewModels;
/**
 修改当前的scrollViewView
 */
- (void)changeCurrentscrollerViewView:(UIScrollView *)scrollViewView;

@end



