//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by 张建 on 2017/3/19.
//  Copyright © 2017年 张建. All rights reserved.
//

#import "AppDelegate.h"

#define openUrlWithZJ @"https://www.baidu.com/"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - 点击对应的Icon后会做回调处理，判断对应的Icon
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    #warning 3D_Touch的功能只有>=Iphone6s的情况下才能使用(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    NSLog(@"得到的点击类型的标识fu：%@", shortcutItem.type);
    if ([shortcutItem.type isEqualToString:@"com.zj.Search"]) {
        NSLog(@"点击了搜索哦======ZJ===");
        //通过Safari打开对应的页面
        [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", openUrlWithZJ]]];
    }else if ([shortcutItem.type isEqualToString:@"com.zj.Navigation"]){
        NSLog(@"点击了导航哦");
        //通过发送通知及时实现导航的操作
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationWithNavigation" object:nil userInfo:nil];
    }else if ([shortcutItem.type isEqualToString:@"com.zj.Play"]){
        NSLog(@"点击了播放按钮的item");
    }
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"App将要失去焦点");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"App将要回到后台的回调");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"将要回到App中,检测用户的登录状态");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"App变成焦点的回调");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"App将要杀死的回调");
}


@end
