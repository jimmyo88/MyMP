//
//  JSONDownloader.h
//  MyMP
//
//  Created by James Owen on 17/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchURLBuilder.h"

@interface JSONDownloader : NSObject

-(void)downloadJsonData;
-(NSArray *)buildModels;
-(id)initWithUrl:(NSURL *)url;

@end
