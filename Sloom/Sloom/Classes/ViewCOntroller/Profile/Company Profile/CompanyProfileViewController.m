//
//  CompanyProfileViewController.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/4/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "CompanyProfileViewController.h"
#import "TopViewEditProfile.h"
@interface CompanyProfileViewController ()

@end

@implementation CompanyProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setLayout];
}

-(void)setLayout{
    TopViewEditProfile* topView = [[TopViewEditProfile alloc]initWithFrame:_topView.frame];
    [_topView addSubview:topView];
    [super setHiddenViewHeader:NO];
    [super setTitleHeader:@"Edit Profile"];
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
