//
//  JSONDownloader.m
//  MyMP
//
//  Created by James Owen on 17/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "JSONDownloader.h"
#import "SearchURLBuilder.h"
#import "ResultModel.h"

@implementation JSONDownloader

-(id)initWithUrl:(SearchUrlBuilder *)searchUrlBuilder
{
    self = [super init];
    if(self)
    {
        self.urlBuilder = searchUrlBuilder;
        self.url = self.urlBuilder.searchUrl;
    }
return self;
}

-(void)downloadJsonData
{
    NSData * data = [NSData dataWithContentsOfURL:
                 [NSURL URLWithString:self.url]];
    NSError *parseError = nil;
    self.json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
}

-(NSDictionary *)buildModels
{
    NSDictionary* result = [self.json objectForKey:@"results"]; //2
    NSArray* constituencies = [result objectForKey:@"constituencies"]; //2
    NSMutableDictionary* resultDict = [NSMutableDictionary dictionary];
    
    for(int i = 0;i<constituencies.count;i++)
    {
        NSDictionary *object = [constituencies objectAtIndex:i];
        [resultDict setValue:object forKey:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:i]]];
        NSLog(@"%@", resultDict);
    }
    
    return resultDict;
}

@end
