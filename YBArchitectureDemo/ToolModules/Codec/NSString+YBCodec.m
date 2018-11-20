//
//  NSString+YBCodec.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/20.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "NSString+YBCodec.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YBCodec)

- (NSString *)yb_encodingUTF8 {
    NSString *result = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self, NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    return result;
}

- (NSString *)yb_MD5 {
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    
    NSString *finalStr = [ret lowercaseString];
    return finalStr;
}

@end
