//
//  myCell2-code.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/20.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "myCell2-code.h"

@interface myCell2_code()

@end

@implementation myCell2_code

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }

    return self;
}

- (void)initUI
{
    self.label1.text = @"cell2-label1";
    self.label1.frame = CGRectMake(10, 2, 30, 30);
    self.label1.textColor = [UIColor redColor];

    self.label2.text = @"label2 text";
    self.label2.frame = CGRectMake(30, 2, 30, 30);
    self.label2.textColor = [UIColor redColor];

    [self addSubview:self.label1];
    [self addSubview:self.label2];
    
    [self.label1 setBackgroundColor:[UIColor yellowColor]];
    [self.label2 setBackgroundColor:[UIColor yellowColor]];
    
//    self.cellLabel1.text = @"cellLabel1";
//    self.cellLabel1.textColor = [UIColor redColor];
//
//    self.cellLabel2.text = @"cellLabel2";
//    self.cellLabel2.textColor = [UIColor blueColor];
    
    self.textLabel.text = @"self-label 1";
    self.textLabel.textColor = [UIColor blueColor];
}

@end
