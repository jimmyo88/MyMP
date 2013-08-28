//
//  searchURLBuilder.m
//  MyMP
//
//  Created by James Owen on 15/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "SearchUrlBuilder.h"

@implementation SearchUrlBuilder

+ (NSURL *)buildURLForSearchQuery:(NSString *)query
{
    NSString *searchQuery = [[NSString stringWithFormat:@"http://findyourmp.parliament.uk/api/search?q=%@&f=js", query] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return [NSURL URLWithString:searchQuery];
}

@end
