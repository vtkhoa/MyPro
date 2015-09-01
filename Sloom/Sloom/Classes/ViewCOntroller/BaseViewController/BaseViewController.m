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
    
    UIImageView* imageBackground = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imageBackground setImage:[UIImage imageNamed:@"splash.png"]];
    [self.view addSubview:imageBackground];
    headerView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 20,DEVICE_SIZE.width , 44)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)selectBtnLeft{
    
}
-(void)selectBtnRight{
    
}
//set left header
-(void)setLeftHeader{
    NSLog(@"set left header");
}
//set right header
-(void)setRightHeader{
    NSLog(@"set right header");
}


@end
