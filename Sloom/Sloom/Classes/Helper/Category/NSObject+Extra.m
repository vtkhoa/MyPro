//
//  NSObject+Extra.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)

- (id)returnObjectWithClass:(Class)cls defaultValue:(id)defaultValue error:(NSError *__autoreleasing *)err
{
    if ([self isKindOfClass:cls] ) {
        return self;
    } else {
        if ([self isKindOfClass:[NSNull class]]) {
            return defaultValue;
        }
        if (err != NULL) *err = [NSError errorWithDomain:@"LHJ" code:50000 userInfo:nil];
        return defaultValue;
    }
}

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(executeBlock__:)
               withObject:block
               afterDelay:delay];
}

- (void)executeBlock__:(void (^)(void))block {
    block();
}

@end
