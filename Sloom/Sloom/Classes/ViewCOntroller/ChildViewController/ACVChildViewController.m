//
//  ACVChildViewController.m
//  Chovinh
//
//  Created by khoa.vt on 8/19/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVChildViewController.h"
#import "ACVNormalTableViewCell.h"
#import "ACVVipTableViewCell.h"
#import "ACVCoreNetwork.h"
#import "Constant.h"


@interface ACVChildViewController () {
    NSArray * threads;
    
}

@end

@implementation ACVChildViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    NSDictionary *params;
//    if (_isMainPage) {
//        
//    }
//    else {
//        params = @{@"node_id":[_myMenuDic objectForKey:@"node_id"],
//                   @"parent_node_id":[[ACVMenuManager shareInstance].currentMenuDic objectForKey:@"node_id"]};
//    }
//    
//    NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, GET_THREADS];
//    
//    [ACVCoreNetwork getMethod:params andURL:url atViewController:self andBlock:^(id data) {
//        NSLog(@"GET_THREADS %@", data);
//        NSMutableArray *vipThreadArray = [[NSMutableArray alloc] init];
//        for (NSDictionary *dic in [[data objectForKey:@"threads"] objectForKey:@"threads_vip"]) {
//            ACVThread *thread = [[ACVThread alloc] initThreadWithDic:dic withType:ThreadTypeVip];
//            [vipThreadArray addObject:thread];
//        }
//        _vipThreadList = vipThreadArray;
//        
//        NSMutableArray *smsThreadArray = [[NSMutableArray alloc] init];
//        for (NSDictionary *dic in [[data objectForKey:@"threads"] objectForKey:@"threads_sms"]) {
//            ACVThread *thread = [[ACVThread alloc] initThreadWithDic:dic withType:ThreadTypeSMS];
//            [smsThreadArray addObject:thread];
//        }
//        _smsThreadList = smsThreadArray;
//        
//        NSMutableArray *normalThreadArray = [[NSMutableArray alloc] init];
//        for (NSDictionary *dic in [[data objectForKey:@"threads"] objectForKey:@"threads_new"]) {
//            ACVThread *thread = [[ACVThread alloc] initThreadWithDic:dic withType:ThreadTypeNormal];
//            [normalThreadArray addObject:thread];
//        }
//        _normalThreadList = normalThreadArray;
//        
//        [_tableView reloadData];
//        
//    } errorCode:^(NSInteger codeError) {
//        
//    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = (ACVVipTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ACVVipTableViewCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - XLPagerTabStripViewControllerDelegate

-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"Table View";
}

-(UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor whiteColor];
}

@end
