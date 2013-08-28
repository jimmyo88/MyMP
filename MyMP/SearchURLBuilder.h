//
//  searchURLBuilder.h
//  MyMP
//
//  Created by James Owen on 15/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResultScreenViewController.h"

@interface SearchUrlBuilder : NSObject

+ (NSURL *)buildURLForSearchQuery:(NSString *)query;

@end
