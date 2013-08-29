//
//  RecentSearchCell.m
//  MyMP
//
//  Created by James Owen on 29/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "RecentSearchCell.h"

@implementation RecentSearchCell

- (void)configureForArray:(NSArray *)array andIndex:(NSIndexPath *)indexPath
{
    self.recentSearchLabel.text = [array objectAtIndex:indexPath.row];
}

@end
