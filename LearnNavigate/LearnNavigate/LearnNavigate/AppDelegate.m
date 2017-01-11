//
//  AppDelegate.m
//  LearnNavigate
//
//  Created by wanhongbin on 16/12/14.
//  Copyright © 2016年 wanhongbin. All rights reserved.
//

#import "AppDelegate.h"
//#import "xibViewController.h"
#import "xibViewController2.h"
#import "ViewController.h"
#import "MyTable1.h"
#import "SegmentVC.h"  // segControl控制器
#import "AnimVC.h"
#import "redpackerViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // xib：加载
    // [self xibLoader];

    // 表格：复用
//    MyTable1 *ctl = [[MyTable1 alloc]init];

    // 导航：
//    [self testNavVC];

    // 动画
    AnimVC *animVc = [[AnimVC alloc] init];
    self.window.rootViewController = animVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

/**
 * xib视图
 */
- (void)xibLoader {
//    xibViewController2 *ctl = [[xibViewController2 alloc]init];
//    ViewController *ctl = [[ViewController alloc]init];

}

/**
 * 导航
 */
- (void)testNavVC {
/*//    SegmentVC *ctl = [[SegmentVC alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController: ctl];
//    self.window.rootViewController = nav;*/
}

/**
 * 动画
 */
- (void)animVC {

    AnimVC *animVc = [[AnimVC alloc] init];
    self.window.rootViewController = animVc;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
