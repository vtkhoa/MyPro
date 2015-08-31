//
//  NSObject+Extra.h
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#define checkData(value, cl, df,er) [value returnObjectWithClass:cl defaultValue:df error:er]

#import <Foundation/Foundation.h>

@interface NSObject (Extra)

- (id) returnObjectWithClass:(Class) cls defaultValue: (id) defaultValue error:(NSError**) err;
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
