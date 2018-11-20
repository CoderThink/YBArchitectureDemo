//
//  YBHomeView.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

/*
 - GeneralModules 放项目独有的通用配置模块（比如通用颜色模块、通用字体模块）
 - ToolModules 放工具类模块（比如系统信息模块）
 - PackageModules 放基于业务的一些封装（比如提示框模块、加载菊花模块）
 - BusinessModules 放业务模块（比如购物车、个人中心）
 */

#import "YBHomeView.h"
#import "YBHomeListCell.h"

static NSString * const kIdentifierOfYBHomeListCell = @"kIdentifierOfYBHomeListCell";

@interface YBHomeView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, strong) NSMutableArray<YBHomeListModel *> *homeListDataArray;
@end

@implementation YBHomeView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

- (void)initViews {
    [self addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - public

- (void)requestHomeListSuccessWithArray:(NSArray<YBHomeListModel *> *)array {
    if (array.count > 0) {
        if (self.currentPage == 0) {
            [self.homeListDataArray removeAllObjects];
        }
        [self.homeListDataArray addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.tableView.mj_header endRefreshing];
}

- (void)requestHomeListFailed {
    self.currentPage = 0;
    [self.homeListDataArray removeAllObjects];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeListDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YBHomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifierOfYBHomeListCell];
    cell.model = self.homeListDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView YBGeneral_configuration];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:YBHomeListCell.class forCellReuseIdentifier:kIdentifierOfYBHomeListCell];
        _tableView.tableFooterView = [UIView new];
        
        @weakify(self);
        [_tableView YBGeneral_addRefreshHeader:^{
            @strongify(self);
            self.currentPage = 0;
            [self.delegate homeView:self requestHomeListWithPage:self.currentPage];
        } footer:^{
            @strongify(self);
            ++self.currentPage;
            [self.delegate homeView:self requestHomeListWithPage:self.currentPage];
        }];
    }
    return _tableView;
}

- (NSUInteger)currentPage {
    if (!_currentPage) {
        _currentPage = 0;
    }
    return _currentPage;
}

- (NSMutableArray<YBHomeListModel *> *)homeListDataArray {
    if (!_homeListDataArray) {
        _homeListDataArray = [NSMutableArray array];
    }
    return _homeListDataArray;
}

@end
