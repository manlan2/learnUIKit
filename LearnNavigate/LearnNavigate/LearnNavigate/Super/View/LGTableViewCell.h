//
//  SuperTableViewCell.h
//  SuperMVVM
//
//  Created by 唐开福 on 16/8/27.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGTableViewCell : UITableViewCell
@property (nonatomic, strong, readonly) UIView       *coverImageView;
@property (nonatomic, strong, readonly) UIView       *bottomLineView;
@property (nonatomic, strong, readonly) UIView       *topLineView;

@property (nonatomic, strong) id dataModel;
@end
