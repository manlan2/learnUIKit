//
//  LGAccountCenterTableViewController.h
//  outbusiness
//
//  Created by 唐开福 on 16/12/14.
//  Copyright © 2016年 唐开福. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGTableViewController.h"
@interface LGRowTableViewController : LGTableViewController
@property (nonatomic, strong, readonly) NSArray *dataArray;


/**
 子类需要重写这个方法来定制数据

 */
- (NSArray *)setupRowData;
@end
