//
//  YBHomeDataCenter.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "YBHomeDataCenter.h"

@implementation YBHomeDataCenter

- (void)network_getHomeListWithPage:(NSInteger)page success:(void (^)(NSArray<YBHomeListModel *> * _Nonnull))success failed:(void (^)(void))failed {
    
    //模拟网络请求
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (success) {
                if (page >= 5) {
                    success(@[]);
                    return;
                }
                
                NSArray *data = @[@{@"name":@"别林斯基", @"motto":@"土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。"},
                                  @{@"name":@"蒙田", @"motto":@"我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友"},
                                  @{@"name":@"德奥弗拉斯多", @"motto":@"时间是一切财富中最宝贵的财富。"}];
                NSMutableArray *result = [NSMutableArray array];
                for (NSDictionary *dic in data) {
                    YBHomeListModel *model = [YBHomeListModel new];
                    model.name = dic[@"name"];
                    model.motto = dic[@"motto"];
                    [result addObject:model];
                }
                success(result);
            }
        });
    });
}

@end
