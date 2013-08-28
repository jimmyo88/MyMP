//
//  ResultCell.m
//  MyMP
//
//  Created by David Perry on 28/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "ResultCell.h"
#import "ImageChooser.h"

@implementation ResultCell

- (void)configureForDictionary:(NSDictionary *)dictionary
{
    self.constitLabel.text = dictionary[@"constituency_name"];
    self.nameLabel.text = dictionary[@"member_name"];
    [self.websiteButton setTitle:dictionary[@"member_website"] forState:UIControlStateNormal];
    self.thumbnailImageView.image = [ImageChooser chooseImage:dictionary[@"member_party"]];
    
    if([dictionary[@"member_website"] length] == 0)
    {
        self.websiteButton.hidden = YES;
    }
    else
    {
        self.websiteButton.hidden = NO;
    }
}

@end
