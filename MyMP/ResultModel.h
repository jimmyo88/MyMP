//
//  ResultModel.h
//  MyMP
//
//  Created by James Owen on 22/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject

@property (nonatomic,strong) NSDictionary *resultCollection;

-(id)initWithDictionary:(NSDictionary *)models;
@end
