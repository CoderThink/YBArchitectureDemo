//
//  YBHomeDataCenter.h
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBHomeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBHomeDataCenter : NSObject

//这里也可以用代理回调网络请求
- (void)network_getHomeListWithPage:(NSInteger)page success:(void(^)(NSArray<YBHomeListModel *> *dataArray))success failed:(void(^)(void))failed;

@end

NS_ASSUME_NONNULL_END
