//
//  LGRowTableViewCell.h
//  outbusiness
//
//  Created by 唐开福 on 16/12/14.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGTableViewCell.h"

typedef enum : NSUInteger {
    LGRowTableViewCellTypeEmpty,
    LGRowTableViewCellTypeArrow,
    LGRowTableViewCellTypeSort,
    LGRowTableViewCellTypeSwitch,
    LGRowTableViewCellTypeTick,

} LGRowTableViewCellType;


@interface LGRowModel : NSObject
@property (nonatomic, copy)   NSString * title;
@property (nonatomic, assign) CGFloat  topSpaceHeight;
@property (nonatomic, assign) CGFloat  rowHeight;
@property (nonatomic, assign) LGRowTableViewCellType rowType;
@property (nonatomic, strong) Class targetViewController;

+ (instancetype)creatRowWithtopSpcaeHeight:(CGFloat)spaceHeight rowHeight:(CGFloat)rowHeight title:(NSString *)title rowType:(LGRowTableViewCellType)type targetVC:(Class)viewControllerClass;
@end

@interface LGRowTableViewCell : LGTableViewCell
@property (nonatomic, strong ,readonly) UIView     *topSpaceView;
@property (nonatomic, strong ,readonly) UIView      *containView;
@property (nonatomic, strong ,readonly) UILabel     *leftTitleLabel;
@property (nonatomic, strong ,readonly) UIImageView *rightimageView;
@property (nonatomic, strong ,readonly) UISwitch    *switchView;
@end
