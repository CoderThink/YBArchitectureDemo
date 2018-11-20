//
//  YBHomeViewController.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBHomeViewController.h"
#import "YBHomeView.h"
#import "YBHomeDataCenter.h"

@interface YBHomeViewController () <YBHomeViewDelegate>
@property (nonatomic, strong) YBHomeView *mainView;
@property (nonatomic, strong) YBHomeDataCenter *dataCenter;
@end

@implementation YBHomeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - YBHomeViewDelegate

- (void)homeView:(YBHomeView *)view requestHomeListWithPage:(NSInteger)page {
    @weakify(self);
    [self.dataCenter network_getHomeListWithPage:page success:^(NSArray<YBHomeListModel *> * _Nonnull dataArray) {
        @strongify(self);
        [self.mainView requestHomeListSuccessWithArray:dataArray];
    } failed:^{
        @strongify(self);
        [self.mainView requestHomeListFailed];
    }];
}

#pragma mark - getter

- (YBHomeView *)mainView {
    if (!_mainView) {
        _mainView = [YBHomeView new];
        _mainView.delegate = self;
    }
    return _mainView;
}

- (YBHomeDataCenter *)dataCenter {
    if (!_dataCenter) {
        _dataCenter = [YBHomeDataCenter new];
    }
    return _dataCenter;
}

@end
