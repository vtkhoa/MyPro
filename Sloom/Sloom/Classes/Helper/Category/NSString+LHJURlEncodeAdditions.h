//
//  NSString+LHJURlEncodeAdditions.h
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LHJURlEncodeAdditions)

- (NSString*)encodedURLParameterStringWith:(NSStringEncoding)encoding;
- (NSString*)encodeAsURIParameterStringWith:(NSStringEncoding)encoding;

@end
