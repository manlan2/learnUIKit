//
//  myCell1.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/20.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "myCell1.h"

@implementation myCell1

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    NSLog(@"initUI");
    
    self.label2.text = @"label2 text";
    self.label2.frame = CGRectMake(10, 5, 50, 20);
    self.label2.textColor = [UIColor redColor];
    
    [self.contentView addSubview:self.label2];
}

@end
