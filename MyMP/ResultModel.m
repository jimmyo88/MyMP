//
//  ResultModel.m
//  MyMP
//
//  Created by James Owen on 22/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ResultModel.h"

@implementation ResultModel

-(id)initWithDictionary:(NSDictionary *)models{
    
    self = [super init];
    if(self)
    {
//        self.constituencyName = withConstituency;
//        self.memberBiographyUrl = andBio;
//        self.memberName = andName;
//        self.memberParty = andParty;
//        self.memberWebsite = andWebsite;
        
//        NSArray *array = [[NSArray alloc]initWithObjects:self.constituencyName, self.memberBiographyUrl, self.memberName, self.memberParty, self.memberWebsite, nil];
        
        self.resultCollection = models;
    }
    
    return self;
    
}


@end
