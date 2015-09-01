//
//  ViewSelectTypeAccount.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/2/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ViewSelectTypeAccount.h"

@interface ViewSelectTypeAccount ()

@end

@implementation ViewSelectTypeAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setLeftHeader];
    [super setRightHeader];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)selectBtnLeft{
    NSLog(@"select btn left");
}

-(void)selectBtnRight{
    NSLog(@"select btn right");
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
