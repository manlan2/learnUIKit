//
//  LGCollectionViewCell.h
//  shop
//
//  Created by 唐开福 on 16/11/1.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGCollectionViewCell : UICollectionViewCell


/**
 四边的线,使用懒加载的形式
 */
@property (nonatomic, strong, readonly) UIView       *leftLineView;
@property (nonatomic, strong, readonly) UIView       *rightLineView;
@property (nonatomic, strong, readonly) UIView       *bottomLineView;
@property (nonatomic, strong, readonly) UIView       *topLineView;

@property (nonatomic, strong, readonly) UIView       *coverView;
@end
