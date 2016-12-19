//
//  LGCollectionViewCell.m
//  shop
//
//  Created by 唐开福 on 16/11/1.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGCollectionViewCell.h"
#import "LGUIUtils.h"
#define LG_CELL_HEIGHE_COVER_COLOR UIColorWithHex(0xd9d9d9)

@interface LGCollectionViewCell()
@property (nonatomic, strong) UIView       *leftLineView;
@property (nonatomic, strong) UIView       *rightLineView;
@property (nonatomic, strong) UIView       *bottomLineView;
@property (nonatomic, strong) UIView       *topLineView;

@property (nonatomic, strong) UIView       *coverView;
@property (nonatomic, strong) UIColor      *originBackColor;
@end

@implementation LGCollectionViewCell
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    if(CGColorEqualToColor(backgroundColor.CGColor, LG_CELL_HEIGHE_COVER_COLOR.CGColor)){
        [super setBackgroundColor:backgroundColor];
    }else{
        self.originBackColor = backgroundColor;
        [super setBackgroundColor:backgroundColor];
    }
}

- (UIView *)coverView
{
    if(_coverView == nil)
    {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
        _coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _coverView.userInteractionEnabled = NO;
        _coverView.alpha = 0.0;
        [self.contentView addSubview:_coverView];
        [self.contentView bringSubviewToFront:_coverView];
    }
    return _coverView;
}

- (UIView *)leftLineView
{
    if(_leftLineView == nil)
    {
        _leftLineView =  [LGUIUtils addVerticalLineInView:self.contentView right:NO topMargin:0 bottomMargin:0];
    }
    return _leftLineView;
}

- (UIView *)rightLineView
{
    if(_rightLineView == nil)
    {
        _rightLineView = [LGUIUtils addVerticalLineInView:self.contentView right:NO topMargin:0 bottomMargin:0];
    }
    return _rightLineView;
}

- (UIView *)topLineView
{
    if(_topLineView == nil)
    {
        _topLineView = [LGUIUtils addLineInView:self.contentView top:YES leftMargin:0 rightMargin:0];
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if(_bottomLineView == nil)
    {
      _bottomLineView = [LGUIUtils addLineInView:self.contentView top:NO leftMargin:0 rightMargin:0];
    }
    return _bottomLineView;
}

- (void)setHighlighted:(BOOL)highlighted
{
    if(_coverView)
    {
        WS(weakSelf)
        [UIView animateWithDuration:0.1f animations:^{
            weakSelf.coverView.alpha = highlighted ? 1.0 : 0.0;
        }];
        return;
    }
    [super setHighlighted:highlighted];
}

- (void)setSelected:(BOOL)selected
{
    if(_coverView)
    {
        WS(weakSelf)
        [UIView animateWithDuration:0.1f animations:^{
            weakSelf.coverView.alpha = selected ? 1.0 : 0.0;
        }];
        return;
    }
    [super setSelected:selected];
}

@end
