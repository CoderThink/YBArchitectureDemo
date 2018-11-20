//
//  NSString+YBCodec.h
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/20.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YBCodec)

- (NSString *)yb_encodingUTF8;

- (NSString *)yb_MD5;

@end

NS_ASSUME_NONNULL_END
