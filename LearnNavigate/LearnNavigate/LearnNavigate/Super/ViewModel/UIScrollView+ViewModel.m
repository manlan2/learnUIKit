//
//  UIScrollView+ViewModel.m
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "UIScrollView+ViewModel.h"
#import "LGScollViewViewModel.h"
#import <objc/runtime.h>
static const char LGScrollViewViewModelKey;

@implementation  UIScrollView (ViewModel)
- (LGScollViewViewModel *)viewModel{
    return  objc_getAssociatedObject(self, &LGScrollViewViewModelKey);
}

- (void)setViewModel:(LGScollViewViewModel *)viewModel{
    objc_setAssociatedObject(self, &LGScrollViewViewModelKey, viewModel, OBJC_ASSOCIATION_ASSIGN);
}

@end
