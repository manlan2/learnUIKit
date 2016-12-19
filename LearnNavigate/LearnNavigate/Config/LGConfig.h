//
//  LGMacro.h
//  shop
//
//  Created by 唐开福 on 16/8/25.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#ifndef LGMacro_h
#define LGMacro_h

#define HTTP_TOKEN @"LaKatoken!@#"

#define LGNavBarHeight 64

//控制使用测试还是正式接口宏  注释是正式环境
#define LG_USE_DEBUG_SERVER 1

 //控制控制台的打印信息,注释是不需要
#define ShopNeedNSLog 1
 //控制打印控制器的入栈和出栈 ， 注释是不需要
#define ShopNeedNSLogPushViewControllerName 1
// 控制打印网络请求的的url和参数， 注释是不需要
#define ShopNeedNSLogRequestURL 1


#define APIVersion 1




#ifdef  LG_USE_DEBUG_SERVER
//#define MAPI @"http://192.168.46.73/leshop.com/mobile"
#define MAPI @"http://shop.xinyi.com/mobile"

#else
#define MAPI @"http://shop.xinyi.com/mobile"
//#define MAPI @"http://192.168.43.188/leshop.com/mobile"

#endif


//http://192.168.46.73/leshop.com/mobile
//http://112.74.40.211/mobile
#ifdef ShopNeedNSLog
#else
#define NSLog(s, ...)  ;
#endif



#ifdef DEBUG
#define kChannelID  @"test"
#else
#define kChannelID  @"AppStore"
#endif




//#define UI_TABBAR_HEIGHT 49

#endif /* LGMacro_h */
