//
//  RecentSearchCell.h
//  MyMP
//
//  Created by James Owen on 29/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentSearchCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *recentSearchLabel;
- (void)configureForArray: (NSArray *)array
                 andIndex: (NSIndexPath *)indexPath;

@end
