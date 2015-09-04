//
//  IndividualProfileViewController.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/4/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "IndividualProfileViewController.h"
#import "TopViewEditProfile.h"
#import "CellPrivateInfo.h"
#define CellPrivateInfomation @"CellPrivateInfo"
@interface IndividualProfileViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray* arrStaticPrivateInfo;
}

@end

@implementation IndividualProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrStaticPrivateInfo = [[NSArray alloc]initWithObjects:@"Firstname",@"Lastname",@"Email",@"Phone",@"Gender",@"Address",@"Website", nil];
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


//=====================View Private Infomation=====================
#pragma mark tableview delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _heightContraintLayer.constant;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return arrStaticPrivateInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellPrivateInfo *cellData = (CellPrivateInfo *)[tableView dequeueReusableCellWithIdentifier:CellPrivateInfomation forIndexPath:indexPath];
    if (!cellData) {
        cellData = [[CellPrivateInfo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellPrivateInfomation];
    }
    [cellData.lbStaticInfo setText:arrStaticPrivateInfo[indexPath.row]];
    return  cellData;
}


//=====================End View Private Infomation=================

@end
