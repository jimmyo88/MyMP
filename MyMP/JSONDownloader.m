//
//  JSONDownloader.m
//  MyMP
//
//  Created by James Owen on 17/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "JSONDownloader.h"
#import "SearchURLBuilder.h"

@interface JSONDownloader ()

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *json;

@end

@implementation JSONDownloader

- (id)initWithUrl:(NSURL *)url
{
    self = [super init];
    
    if(self)
    {
        self.url = url;
    }
    
    return self;
}

-(void)downloadJsonData
{
    NSData * data = [NSData dataWithContentsOfURL:self.url];
    NSError *parseError = nil;
    self.json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
}

- (NSArray *)buildModels
{
    NSDictionary* result = [self.json objectForKey:@"results"]; //2
    NSArray* constituencies = [result objectForKey:@"constituencies"]; //2
    
    return constituencies;
}

@end
