//
//  ResultModel.h
//  MyMP
//
//  Created by James Owen on 22/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject
//
//@property (nonatomic,strong) NSString *constituencyName;
//@property (nonatomic,strong) NSString *memberBiographyUrl;
//@property (nonatomic,strong) NSString *memberName;
//@property (nonatomic,strong) NSString *memberParty;
//@property (nonatomic,strong) NSString *memberWebsite;

@property (nonatomic,strong) NSDictionary *resultCollection;

//-(id)initWithObject:(NSString *)withConstituency
//                     :(NSString *)andBio
//                     :(NSString *)andName
//                     :(NSString *)andParty
//                     :(NSString *)andWebsite;

-(id)initWithDictionary:(NSDictionary *)models;
@end
