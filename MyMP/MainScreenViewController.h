//
//  ViewController.h
//  MyMP
//
//  Created by James Owen on 13/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMpLocationManager.h"
#import "SearchURLBuilder.h"
#import "JSONDownloader.h"

@class MyMpLocationManager;
@class SearchUrlBuilder;
@class JSONDownloader;

@interface MainScreenViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *searchPostcodeButton;
@property (strong, nonatomic) IBOutlet UIButton *searchKeywordButton;
@property (strong, nonatomic) IBOutlet UILabel *promptLabel;
@property (strong, nonatomic) IBOutlet UIButton *geolocationButton;
@property (nonatomic, strong) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UITextField *keyWordTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end
