//
//  BaseViewController.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/1/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (){
    HeaderView* headerView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    headerView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 20,DEVICE_SIZE.width , 44)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitleHeader:(NSString*)strTitle{
    [headerView.lbTitle setText:strTitle];
}

#pragma mark delegate from header view
-(void)selectBtnLeft{
    
}
-(void)selectBtnRight{
    
}

-(void)setHiddenViewHeader:(BOOL)status{
    [headerView setHidden:status];
}

//set left header
-(void)setLeftHeader:(UIImage*)image stringLabel:(NSString*)strLabel{
    
    NSLog(@"set left header");
}
//set right header
-(void)setRightHeader:(UIImage*)image stringLabel:(NSString*)strLabel{
    NSLog(@"set right header");
}


@end
