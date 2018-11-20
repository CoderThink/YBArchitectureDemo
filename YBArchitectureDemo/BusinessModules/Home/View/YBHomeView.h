//
//  YBHomeView.h
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBHomeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@class YBHomeView;

@protocol YBHomeViewDelegate <NSObject>

@required

- (void)homeView:(YBHomeView *)view requestHomeListWithPage:(NSInteger)page;

@end

@interface YBHomeView : UIView

@property (nonatomic, weak) id<YBHomeViewDelegate> delegate;

- (void)requestHomeListSuccessWithArray:(NSArray<YBHomeListModel *> *)array;

- (void)requestHomeListFailed;

@end

NS_ASSUME_NONNULL_END
