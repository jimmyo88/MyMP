//
//  JSONDownloader.m
//  MyMP
//
//  Created by James Owen on 17/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "JSONDownloader.h"

@implementation JSONDownloader

-(void)downloadJsonResponse
{
//create the the data from the URL
NSData * data = [NSData dataWithContentsOfURL:
                 [NSURL URLWithString:self.url]];

NSError *parseError = nil;

//get the JSON response as one dictionary
NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
// NSLog(@"%@",json);
}

-(void)jsonHasBeenDownloaded
{
}

@end
