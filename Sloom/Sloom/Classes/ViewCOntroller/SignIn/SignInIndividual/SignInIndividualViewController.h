//
//  SignInIndividualViewController.h
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/2/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "BaseViewController.h"
#import "UITextField+Extra.h"
#import "UIButton+Extra.h"
@interface SignInIndividualViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtJobTitle;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

@property (weak, nonatomic) IBOutlet UILabel *lbTerm;
- (IBAction)tapHideKB:(id)sender;

- (IBAction)btnSubmit:(id)sender;
@end
