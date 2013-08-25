//
//  ImageChooser.m
//  MyMP
//
//  Created by James Owen on 25/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ImageChooser.h"

@implementation ImageChooser

+(UIImage *)chooseImage:(NSString *)name
{
    UIImage *image = [[UIImage alloc]init];
    
    if ([name isEqualToString: @"Labour"])
    {
        image = [UIImage imageNamed:@"labour_logo.png"];
    }
    else if ([name isEqualToString: @"Conservative"])
    {
        image = [UIImage imageNamed:@"conservative_logo.png"];
    }
    else if ([name isEqualToString: @"Democratic Unionist"])
    {
        image = [UIImage imageNamed:@"democratic_unionist.gif"];
    }
    else if ([name isEqualToString: @"Green"])
    {
        image = [UIImage imageNamed:@"green_logo.gif"];
    }
    else if ([name isEqualToString: @"Independent"])
    {
        image = [UIImage imageNamed:@"independent_logo.png"];
    }
    else if ([name isEqualToString: @"Liberal Democrat"])
    {
        image = [UIImage imageNamed:@"liberal_democrat_logo.jpg"];
    }
    else if ([name isEqualToString: @"Plaid Cymru"])
    {
        image = [UIImage imageNamed:@"plaid_cymru_logo.jpg"];
    }
    else if ([name isEqualToString: @"Respect"])
    {
        image = [UIImage imageNamed:@"respect_logo.jpg"];
    }
    else if ([name isEqualToString: @"Scottish National"])
    {
        image = [UIImage imageNamed:@"scottish_national_logo.jpg"];
    }
    else if ([name isEqualToString: @"Sinn Fein"])
    {
        image = [UIImage imageNamed:@"sinn_fein_logo.jpg"];
    }
    else if ([name isEqualToString: @"Social Democratic & Labour Party"])
    {
        image = [UIImage imageNamed:@"SDLP_logo.jpg"];
    }
    else if ([name isEqualToString: @"Alliance"])
    {
        image = [UIImage imageNamed:@"alliance_logo"];
    }
    
    return image;
    
}

@end
