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

@interface MainScreenViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) MyMpLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet UITextField *searchTextField;



@end
