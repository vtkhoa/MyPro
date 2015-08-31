//
//  NSURL+Extra.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/14/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSURL+Extra.h"
#import "NSString+Extra.h"

@implementation NSURL (Extra)

- (NSMutableDictionary *)dictionaryForQueryString {
    
    return [[self path] dictionaryFromQueryStringComponents];
}

@end
