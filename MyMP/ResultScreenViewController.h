//
//  ResultScreenViewController.h
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultModel.h"

@interface ResultScreenViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) ResultModel *results;
@property (nonatomic, strong) NSString *memberUrl;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

