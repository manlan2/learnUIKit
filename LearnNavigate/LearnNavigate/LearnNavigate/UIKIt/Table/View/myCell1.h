//
//  myCell1.h
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/20.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCell1 : UITableViewCell

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *cellLabel1;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel2;

@end
