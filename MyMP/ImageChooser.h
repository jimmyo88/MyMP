//
//  ImageChooser.h
//  MyMP
//
//  Created by James Owen on 25/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageChooser : NSObject

@property (nonatomic, strong)UIImage *imageView;

//-(id)initWithConstituency:(NSString *)name;

+(UIImage *)chooseImage:(NSString *)name;

@end
