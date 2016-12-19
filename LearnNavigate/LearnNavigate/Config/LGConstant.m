//
//  LGConstant.m
//  shop
//
//  Created by 唐开福 on 16/9/2.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#import "LGConstant.h"
#import <Foundation/Foundation.h>


CGFloat const UI_NAVBAR_HEIGHT              = 64;
CGFloat const UI_TABBAR_HEIGHT              = 49;
CGFloat const UI_STATUS_HEIGHT              = 20;


NSString *const NOTIFICATION_ORDER_NEW       = @"NOTIFICATION_ORDER_NEW";
NSString *const NOTIFICATION_ORDER_CANCEL    = @"NOTIFICATION_ORDER_CANCEL";


NSString *const ORDER_REFUND_HANDLE_URL = @"index.php?act=wmm_order_refund_manage&op=order_refund_list";

NSString *const ORDER_REFUND_NO_HANDLE_URL = @"index.php?act=wmm_order_refund_manage&op=not_handle_refund";
