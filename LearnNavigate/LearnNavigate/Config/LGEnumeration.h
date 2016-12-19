//
//  LGEnumeration.h
//  shop
//
//  Created by 唐开福 on 16/10/26.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#ifndef LGEnumeration_h
#define LGEnumeration_h

typedef enum : NSUInteger {
    LGNoDataSytleDefault = 0, // 没有数据

} LGNoDataStyle;

typedef enum : NSUInteger {
    LGOrderStateAll,      // 全部
    LGOrderStateWaitSend, // 等待方法
    LGOrderStateSending,  // 配送中
    LGOrderStateArrived,  // 已送达
    LGOrderStateCancel,   // 无效

} LGOrderState;

typedef enum : NSUInteger {
    LGOrderHandleBeginMake, //接收
    LGOrderHandleFinish,    //完成
    LGOrderHandleSend,      //送出
    LGOrderHandleCancel,    //取消
} LGOrderHandle;
#endif /* LGEnumeration_h */
