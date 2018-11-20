//
//  YBRootTabBarViewController.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBRootTabBarViewController.h"
#import "YBNaviagtionViewController.h"
#import "YBHomeViewController.h"
#import "YBTrendsViewController.h"
#import "YBMineViewController.h"

@interface YBRootTabBarViewController ()

@property (nonatomic, strong) YBHomeViewController *homeVC;
@property (nonatomic, strong) YBTrendsViewController *trendsVC;
@property (nonatomic, strong) YBMineViewController *mineVC;

@end

@implementation YBRootTabBarViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.shadowImage = [UIImage new];
    
    [self configSubViewControllers];
}

#pragma mark - private

- (void)configSubViewControllers {
    self.viewControllers = @[[self getViewControllerWithVC:self.homeVC title:@"主页" normalImage:[UIImage new] selectImage:[UIImage new]],
                             [self getViewControllerWithVC:self.trendsVC title:@"动态" normalImage:[UIImage new] selectImage:[UIImage new]],
                             [self getViewControllerWithVC:self.mineVC title:@"我的" normalImage:[UIImage new] selectImage:[UIImage new]]];
}

- (UIViewController *)getViewControllerWithVC:(UIViewController *)vc title:(NSString *)title normalImage:(UIImage *)normalImage selectImage:(UIImage *)selectImage {
    
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:YBGeneralColor.tabBarTitleSelectedColor} forState:UIControlStateSelected];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:YBGeneralColor.tabBarTitleNormalColor} forState:UIControlStateNormal];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    vc.navigationItem.title = title;
    YBNaviagtionViewController *nav = [[YBNaviagtionViewController alloc] initWithRootViewController:vc];
    return nav;
}

#pragma mark - getter

- (YBHomeViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = [YBHomeViewController new];
    }
    return _homeVC;
}

- (YBTrendsViewController *)trendsVC {
    if (!_trendsVC) {
        _trendsVC = [YBTrendsViewController new];
    }
    return _trendsVC;
}

- (YBMineViewController *)mineVC {
    if (!_mineVC) {
        _mineVC = [YBMineViewController new];
    }
    return _mineVC;
}

@end
