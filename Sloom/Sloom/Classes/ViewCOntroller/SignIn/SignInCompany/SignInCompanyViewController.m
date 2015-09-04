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
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setLayout];
}
-(void)setLayout{
    [super setHiddenViewHeader:NO];
    [super setTitleHeader:@"Company Form"];
    [_txtFullName formatTextFieldWithHardText:@"Fullname"];
    [_txtEmail formatTextFieldWithHardText:@"Email"];
    [_txtPassword formatTextFieldWithHardText:@"Password"];
    [_txtConfirmPassword formatTextFieldWithHardText:@"Confirm password"];
    [_txtIndustry formatTextFieldWithHardText:@"Industry"];
    [_txtAddress formatTextFieldWithHardText:@"Address"];
    [_txtCountry formatTextFieldWithHardText:@"Country"];
    [_btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
    [_btnSubmit setBackgroundColor:kButtonGreenColor];
    [_btnSubmit setLayerBorderWidth:KBoderButtonWidth borderColor:kBoderButtonColorWhite cornerRadius:_btnSubmit.frame.size.height/2];
    NSString* stringTerm = @"Term & Condition";
    [_lbTerm setTextColor:kTextFieldPlaceholder];
    [_lbTerm setAttributedText:[ACVUtilities attributedWithColorAtPosition:stringTerm.length withString:_lbTerm.text withColor:kTermConditionColor]];
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

- (IBAction)tapHideKB:(id)sender {
    [_txtAddress resignFirstResponder];
    [_txtConfirmPassword resignFirstResponder];
    [_txtCountry resignFirstResponder];
    [_txtEmail resignFirstResponder];
    [_txtFullName resignFirstResponder];
    [_txtIndustry resignFirstResponder];
    [_txtPassword resignFirstResponder];
}

- (IBAction)btnSubmit:(id)sender {
}
@end
