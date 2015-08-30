//
//  ACVCoreNetwork.m
//  Chovinh
//
//  Created by khoa.vt on 8/20/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVCoreNetwork.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"

@implementation ACVCoreNetwork

+ (void)postMethod:(NSDictionary *)params andURL:(NSString *)url atViewController:(UIViewController *)viewControlLer andBlock:(void(^)(id data))completionBlock errorCode:(void(^)( NSInteger codeError))errorBlock;{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewControlLer.view animated:YES];
    hud.labelText = @"Loading...";
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    [operationManager.requestSerializer setTimeoutInterval:30];
    AFJSONResponseSerializer *jsonReponseSerializer = [AFJSONResponseSerializer serializer];
    jsonReponseSerializer.acceptableContentTypes = nil;
    operationManager.responseSerializer = jsonReponseSerializer;
    
    [operationManager POST:url
                parameters:params
                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       
                       completionBlock(responseObject);
                       
                   }
                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       // Enter what happens here if failure happens
                       [MBProgressHUD hideHUDForView:viewControlLer.view animated:YES];            
                       errorBlock([error code]);
                       
                   }];
    
}

+ (void)getMethod:(NSDictionary *)params andURL:(NSString *)url atViewController:(UIViewController *)viewControlLer andBlock:(void(^)(id data))completionBlock errorCode:(void(^)( NSInteger codeError))errorBlock{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewControlLer.view animated:YES];
    hud.labelText = @"Loading...";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setTimeoutInterval:15];
    // if you want to sent parameters you can use above code
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *urlData=url;
    [manager GET:urlData parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject);
        [MBProgressHUD hideHUDForView:viewControlLer.view animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
       
        [MBProgressHUD hideHUDForView:viewControlLer.view animated:YES];
        
        errorBlock([error code]);
        
    }];
}


@end
