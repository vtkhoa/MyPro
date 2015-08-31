//
//  NSLayoutManager+Extra.h
//  ViecLamTayTrai
//
//  Created by Nguyen Quang Vu on 6/19/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutManager_Extra : NSLayoutManager
- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color;
@end
