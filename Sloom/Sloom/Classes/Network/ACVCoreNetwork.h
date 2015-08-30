//
//  ACVCoreNetwork.h
//  Chovinh
//
//  Created by khoa.vt on 8/20/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ACVCoreNetwork : NSObject

+ (void)postMethod:(NSDictionary *)params andURL:(NSString *)url atViewController:(UIViewController *)viewControlLer andBlock:(void(^)(id data))completionBlock errorCode:(void(^)( NSInteger codeError))errorBlock;
+ (void)getMethod:(NSDictionary *)params andURL:(NSString *)url atViewController:(UIViewController *)viewControlLer andBlock:(void(^)(id data))completionBlock errorCode:(void(^)( NSInteger codeError))errorBlock;
@end
