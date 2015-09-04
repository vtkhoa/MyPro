//
//  SignInIndividualViewController.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/2/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "SignInIndividualViewController.h"

@interface SignInIndividualViewController ()

@end

@implementation SignInIndividualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setLayout];
}
-(void)setLayout{
    [super setHiddenViewHeader:NO];
    [super setTitleHeader:@"Individual Form"];
    [_txtFirstName formatTextFieldWithHardText:@"Firstname"];
    [_txtEmail formatTextFieldWithHardText:@"Email"];
    [_txtPassword formatTextFieldWithHardText:@"Password"];
    [_txtConfirmPassword formatTextFieldWithHardText:@"Confirm password"];
    [_txtLastName formatTextFieldWithHardText:@"Lastname"];
    [_txtJobTitle formatTextFieldWithHardText:@"Job title"];
    [_btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
    [_btnSubmit setBackgroundColor:kButtonGreenColor];
    [_btnSubmit setLayerBorderWidth:KBoderButtonWidth borderColor:kBoderButtonColorWhite cornerRadius:_btnSubmit.frame.size.height/2];
    NSString* stringTerm = @"Term & Condition";
    [_lbTerm setTextColor:kTextFieldPlaceholder];
    [_lbTerm setAttributedText:[ACVUtilities attributedWithColorAtPosition:stringTerm.length withString:_lbTerm.text withColor:kTermConditionColor]];
}

#pragma mark delegate from headerview super view
-(void)selectBtnLeft{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark IBAction button
- (IBAction)tapHideKB:(id)sender {
    [_txtFirstName resignFirstResponder];
    [_txtConfirmPassword resignFirstResponder];
    [_txtLastName resignFirstResponder];
    [_txtEmail resignFirstResponder];
    [_txtJobTitle resignFirstResponder];
    [_txtPassword resignFirstResponder];
}
- (IBAction)btnSubmit:(id)sender {
}
@end
