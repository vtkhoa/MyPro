//
//  CellPrivateInfo.h
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/5/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellPrivateInfo : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbStaticInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbDynamicInfo;

@end
