//
//  AppDelegate.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/18.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "AppDelegate.h"
#import "YBRootTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initRootUI];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - private

- (void)initRootUI {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = [YBRootTabBarViewController new];
    [_window makeKeyAndVisible];
}


@end
