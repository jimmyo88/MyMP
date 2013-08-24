//
//  JSONDownloader.h
//  MyMP
//
//  Created by James Owen on 17/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchURLBuilder.h"
#import "ResultModel.h"

@interface JSONDownloader : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic) SearchUrlBuilder *urlBuilder;
@property (nonatomic, strong) NSMutableDictionary *json;

-(void)downloadJsonData;
-(NSDictionary *)buildModels;
-(id)initWithUrl:(SearchUrlBuilder *)searchUrlBuilder;

@end
