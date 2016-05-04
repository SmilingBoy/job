//
//  AppDelegate.m
//  兼职
//
//  Created by lx on 16/5/3.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    //创建主界面底部标签栏
    MainTabBarController *mainTabBar = [[MainTabBarController alloc]init];
    
    self.window.rootViewController = mainTabBar;
    
    return YES;
}


@end
