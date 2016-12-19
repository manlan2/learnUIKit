//
//  SuperTableViewCell.m
//  SuperMVVM
//
//  Created by 唐开福 on 16/8/27.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import "LGTableViewCell.h"
#import "LGUIUtils.h"

@interface LGTableViewCell()
@property (nonatomic, strong) UIView       *coverImageView;
@property (nonatomic, strong) UIView       *bottomLineView;
@property (nonatomic, strong) UIView       *topLineView;
//@property (nonatomic, strong) UIColor *originBackColor;
@end

@implementation LGTableViewCell

//
//- (void)setBackgroundColor:(UIColor *)backgroundColor{
//    if(CGColorEqualToColor(backgroundColor.CGColor, LG_CELL_HEIGHE_COVER_COLOR.CGColor)){
//        [super setBackgroundColor:backgroundColor];
//    }else{
//        self.originBackColor = backgroundColor;
//        [super setBackgroundColor:backgroundColor];
//    }
//}
//
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
//{
//    if(self.isEditing || self.selectionStyle == UITableViewCellSelectionStyleNone) {
//        [super setHighlighted:highlighted animated:animated];
//        return;
//    }
//    
//    if(_coverImageView)
//    {
//        if(highlighted)
//        {
//            _coverImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//            
//        }else
//        {
//            _coverImageView.backgroundColor = [UIColor clearColor];
//        }
//        return;
//    }
//    
//    if (highlighted)
//    {
//        self.backgroundColor = LG_CELL_HEIGHE_COVER_COLOR;
//        self.contentView.backgroundColor = LG_CELL_HEIGHE_COVER_COLOR;
//        
//    }else
//    {
//        self.backgroundColor = self.originBackColor;
//        self.contentView.backgroundColor = self.originBackColor;
//    }
//}
//
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    if(self.isEditing || self.selectionStyle == UITableViewCellSelectionStyleNone) {
//        [super setSelected:selected animated:animated];
//        return;
//    }
//    
//    if(_coverImageView)
//    {
//        if(selected)
//        {
//            [UIView animateWithDuration:0.3f animations:^(){
//                _coverImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//            } completion:^(BOOL isFinish){
//            }];
//            
//        }else
//        {
//            [UIView animateWithDuration:0.3f animations:^(){
//                _coverImageView.backgroundColor = [UIColor clearColor];
//            } completion:^(BOOL isFinish){
//            }];
//        }
//        return;
//    }
//    
//    if (selected)
//    {
//        self.backgroundColor = LG_CELL_HEIGHE_COVER_COLOR;
//        self.contentView.backgroundColor = LG_CELL_HEIGHE_COVER_COLOR;
//    }else
//    
//    {
//        [UIView animateWithDuration:0.3f animations:^(){
//            self.backgroundColor = self.originBackColor;
//            self.contentView.backgroundColor = self.originBackColor;
//        } completion:^(BOOL isFinish){
//            
//        }];
//    }
//}

- (UIView *)coverImageView
{
    if(_coverImageView == nil)
    {
        _coverImageView = [[UIView alloc] initWithFrame:self.bounds];
        _coverImageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        _coverImageView.userInteractionEnabled = NO;
        [self.contentView addSubview:_coverImageView];
        [self.contentView bringSubviewToFront:_coverImageView];
    }
    return _coverImageView;
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

@end
