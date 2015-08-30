//
//  ACVSplashViewController.m
//  Chovinh
//
//  Created by khoa.vt on 8/12/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVSplashViewController.h"

@interface ACVSplashViewController ()

@end

@implementation ACVSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(moveView)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)moveView {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *navigation = [mainStoryBoard instantiateViewControllerWithIdentifier:@"NavigationController"];
    [self presentViewController:(UIViewController *)navigation animated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
