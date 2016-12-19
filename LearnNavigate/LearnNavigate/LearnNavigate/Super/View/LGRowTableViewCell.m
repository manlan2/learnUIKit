//
//  LGRowTableViewCell.m
//  outbusiness
//
//  Created by 唐开福 on 16/12/14.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGRowTableViewCell.h"

#define LG_CELL_HEIGHE_COVER_COLOR UIColorWithHex(0xd9d9d9)
@implementation LGRowModel

+ (instancetype)creatRowWithtopSpcaeHeight:(CGFloat)spaceHeight rowHeight:(CGFloat)rowHeight title:(NSString *)title rowType:(LGRowTableViewCellType)type targetVC:(Class)viewControllerClass{
    
    LGRowModel *rowModel =  [[self alloc] init];
    rowModel.topSpaceHeight = spaceHeight;
    rowModel.rowHeight = rowHeight;
    rowModel.title = title;
    rowModel.rowType = type;
    rowModel.targetViewController = viewControllerClass;
    return rowModel;
}

@end

@interface LGRowTableViewCell()
@property (nonatomic, strong) UIView *topSpaceView;
@property (nonatomic, strong) UIView *containView;

@property (nonatomic, strong) UILabel *leftTitleLabel;
@property (nonatomic, strong) UIImageView *rightimageView;
@property (nonatomic, strong) UISwitch    *switchView;

@end

@implementation LGRowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        _topSpaceView = [[UIView alloc] init];
        _containView = [[UIView alloc] init];
        _containView.backgroundColor = [UIColor whiteColor];
        _leftTitleLabel = [UILabel createLabelWithText:nil textColor:UIColorWithHex(0x222222) fontSize:15 textAlignment:NSTextAlignmentLeft];
        _rightimageView = [[UIImageView alloc] init];
        _switchView = [[UISwitch alloc] init];
        [self.contentView addSubview:_topSpaceView];
        [self.contentView addSubview:_containView];

        [self.contentView addSubview:_leftTitleLabel];
        [self.contentView addSubview:_rightimageView];
        [self.contentView addSubview:_switchView];
        [self layoutSubviewsWithConstraints];
    }
    return self;
}


- (void)layoutSubviewsWithConstraints {
    
    WS(weakSelf)
    [_topSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(weakSelf.contentView);
        make.height.mas_equalTo(0);
    }];
    
    [_containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(weakSelf.contentView);
        make.top.mas_equalTo(weakSelf.topSpaceView.mas_bottom);
    }];
    
    [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(weakSelf.containView);
    }];
    
    [_rightimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(weakSelf.containView);
    }];
    
    [_switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(weakSelf.containView);
    }];
}


- (void)updateConstraints
{
    LGRowModel *rowModel = self.dataModel;
    [self.topSpaceView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(rowModel.topSpaceHeight);
    }];
    [super updateConstraints];
}

- (void)setDataModel:(LGRowModel *)dataModel
{
    [super setDataModel:dataModel];
    self.leftTitleLabel.text = dataModel.title;

    NSString *imageName = nil;
    switch (dataModel.rowType) {
        case LGRowTableViewCellTypeEmpty:
        {
            imageName = nil;
            self.rightimageView.hidden = YES;
            self.switchView.hidden = YES;
        }
            break;
        case LGRowTableViewCellTypeArrow:
        {
            imageName = @"pubic_icon_enter";
            self.rightimageView.hidden = NO;
            self.switchView.hidden = YES;
        }
            break;
        case LGRowTableViewCellTypeSort:
        {
            imageName = @"";
            self.rightimageView.hidden = NO;
            self.switchView.hidden = YES;
        }
            break;
        case LGRowTableViewCellTypeSwitch:
        {
            imageName = nil;
            self.rightimageView.hidden = YES;
            self.switchView.hidden = NO;
        }
            break;
        case LGRowTableViewCellTypeTick: {
            imageName = @"public_icon_tick";
            self.rightimageView.hidden = NO;
            self.switchView.hidden = YES;
        }
            break;
    }
    
    if(imageName)
    {
        self.rightimageView.image = LGImage(imageName);
    }
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if(self.isEditing || self.selectionStyle == UITableViewCellSelectionStyleNone) {
        [super setHighlighted:highlighted animated:animated];
        return;
    }

    if (highlighted)
    {
        self.containView.backgroundColor = LG_CELL_HEIGHE_COVER_COLOR;
    }else
    {
        self.containView.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(self.isEditing || self.selectionStyle == UITableViewCellSelectionStyleNone) {
        [super setSelected:selected animated:animated];
        return;
    }
    if (selected)
    {
        self.containView.backgroundColor  = LG_CELL_HEIGHE_COVER_COLOR;
    }else
    {
        self.containView.backgroundColor = [UIColor whiteColor];
    }
}

@end
