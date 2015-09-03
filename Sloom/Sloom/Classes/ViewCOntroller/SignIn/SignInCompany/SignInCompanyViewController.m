//
//  SignInCompanyViewController.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/2/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "SignInCompanyViewController.h"

@interface SignInCompanyViewController ()

@end

@implementation SignInCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setHiddenViewHeader:NO];
    [super setTitleHeader:@"Company Form"];
    [self setLayout];
    // Do any additional setup after loading the view.
}

-(void)setLayout{
    [_txtFullName formatTextFieldWithHardText:@"Fullname"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate from headerview super view
-(void)selectBtnLeft{
    [self.navigationController popViewControllerAnimated:YES];
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
