//
//  LGGlobalFunc.h
//  shop
//
//  Created by 唐开福 on 16/11/24.
//  Copyright © 2016年 zoomwoo. All rights reserved.
//

#ifndef LGGlobalFunc_h
#define LGGlobalFunc_h
#import <UIKit/UIKit.h>
#import "LGAppSetting.h"
#import "LGUserInfo.h"
#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;
#define IOS10           ([[[UIDevice currentDevice] systemVersion] integerValue] >= 10)

#define LGMainColor UIColorWithHex(0xFF5350)

static inline NSString * LGStringNotNil(NSString *string) {
    return (string ? string : @"");
};

static inline BOOL LGEmptyString(NSString *string) {
    return string == nil || string.length == 0;
}

static inline NSString * LGUserKey() {
    return LGStringNotNil([LGAppSetting sharedInstance].userKey);
}

static inline UIImage *LGImage(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

static inline UIFont  *LGFont(CGFloat fontSize) {
    return [UIFont systemFontOfSize:fontSize];
}

static inline UIFont *LGBoldSFont(CGFloat fontSize){
   return  [UIFont boldSystemFontOfSize:fontSize];
}

static inline UIColor *UIColorWithHexAndAlpha(long hexColor, float opacity)
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

static inline UIColor *UIColorWithHex(long hexColor)
{
    return UIColorWithHexAndAlpha(hexColor, 1.f);
}

static inline CGSize LGScreenSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

static inline CGFloat LGScreenWidth() {
    
    return LGScreenSize().width;
}

static inline CGFloat LGScreenHeight() {
    
    return LGScreenSize().height;
}


static inline void LKViewSetFrame(UIView *view, CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    view.frame = CGRectMake(x, y, w, h);
}

static inline CGFloat LKViewRightX(UIView *view) {
    return CGRectGetMaxX(view.frame);
}


#endif /* LGGlobalFunc_h */
