//
//  ACVChildViewController.h
//  Chovinh
//
//  Created by khoa.vt on 8/19/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"


@interface ACVChildViewController : UIViewController <XLPagerTabStripChildItem, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
