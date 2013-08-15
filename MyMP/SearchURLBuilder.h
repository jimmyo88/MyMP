//
//  searchURLBuilder.h
//  MyMP
//
//  Created by James Owen on 15/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchUrlBuilder : NSObject

@property(nonatomic, strong) NSString *URLPREFIX;
@property(nonatomic, strong) NSString *URLSUFFIX;
@property(nonatomic, strong) NSString *searchQuery;
@property(nonatomic, strong) NSMutableString *searchUrl;

-(void)buildUrl;
-(void)removeWhiteSpace;

@end
