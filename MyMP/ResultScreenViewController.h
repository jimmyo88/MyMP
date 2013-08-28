//
//  ResultScreenViewController.h
//  MyMP
//
//  Created by James Owen on 24/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultScreenViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) NSString *searchText;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

