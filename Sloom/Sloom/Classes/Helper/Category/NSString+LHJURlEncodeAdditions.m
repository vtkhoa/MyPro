//
//  NSString+LHJURlEncodeAdditions.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSString+LHJURlEncodeAdditions.h"

@implementation NSString (LHJURlEncodeAdditions)

- (NSString*)encodedURLParameterStringWith:(NSStringEncoding)encoding{
    
    if ([self length] == 0) {
        return @"";
    }
    
    static const char* characters = "0123456789ABCDEF";
    
    const char* src = [self cStringUsingEncoding:encoding];
    if (!src) {
        return @"";
    }
    
    NSUInteger len = [self lengthOfBytesUsingEncoding:encoding];
    char buf[len * 3];
    char* dest = buf;
    
    for (NSUInteger i = 0; i < len; i++) {
        unsigned char c = *src++;
        if ((('a' <= c) && (c <= 'z'))
            || (('A' <= c) && (c <= 'Z'))
            || (('0' <= c) && (c <= '9'))
            || (c == '.')
            || (c == '-')
            || (c == '*')
            || (c == '_')) {
            *dest++ = c;
        }else{
            *dest++ = '%';
            *dest++ = characters[c / 16];
            *dest++ = characters[c % 16];
        }
    }
    
    return [[NSString alloc] initWithBytes:buf length:dest - buf encoding:NSASCIIStringEncoding];
}

- (NSString*)encodeAsURIParameterStringWith:(NSStringEncoding)encoding{
    if ([self length] == 0) {
        return @"";
    }
    
    static const char* characters = "0123456789ABCDEF";
    
    const char* src = [self cStringUsingEncoding:encoding];
    if (!src) {
        return @"";
    }
    
    NSUInteger len = [self lengthOfBytesUsingEncoding:encoding];
    char buf[len * 3];
    char* dest = buf;
    
    for (NSUInteger i = 0; i < len; i++) {
        unsigned char c = *src++;
        if ((('a' <= c) && (c <= 'z'))
            || (('A' <= c) && (c <= 'Z'))
            || (('0' <= c) && (c <= '9'))) {
            *dest++ = c;
        } else {
            *dest++ = '%';
            *dest++ = characters[c / 16];
            *dest++ = characters[c % 16];
        }
    }
    
    return [[NSString alloc] initWithBytes:buf length:dest - buf encoding:NSASCIIStringEncoding];
}

@end
