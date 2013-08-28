//
//  ResultCell.h
//  MyMP
//
//  Created by David Perry on 28/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *constitLabel;
@property (nonatomic, strong) IBOutlet UIButton *websiteButton;

- (void)configureForDictionary:(NSDictionary *)dictionary;

@end
