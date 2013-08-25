//
//  ViewController.m
//  MyMP
//
//  Created by James Owen on 13/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "MainScreenViewController.h"
#import "ResultScreenViewController.h"
#import <MapKit/MapKit.h>

#define POSTCODE_SEGMENT 0

@interface MainScreenViewController ()
@property NSMutableDictionary *json;
@end


@implementation MainScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[MyMpLocationManager alloc] init];
    self.searchTextField.delegate = self;
    self.keyWordTextField.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)geolocationButtonPressed:(UIButton *)sender
{
    self.searchTextField.placeholder = @"Getting Location";
    [self.locationManager startLocationUpdatesWithCompletion:^(CLLocation *location, BOOL success, NSError *error)
    {
        [self.locationManager stopLocationUpdates];
        [self.locationManager reverseGeoCodeWithCompletion:^(BOOL success, NSError *error)
        {
            self.searchTextField.text = [self.locationManager truncatePostcodeAndRemoveWhiteSpace];
        }];
    }];
}

-(void)runPostcodeSearch
{
    SearchUrlBuilder *urlBuilder = [[SearchUrlBuilder alloc]init];
    urlBuilder.searchQuery = self.searchTextField.text;
    [urlBuilder buildPostCodeUrl];
    
    JSONDownloader *downloader = [[JSONDownloader alloc]initWithUrl:urlBuilder];
    [downloader downloadJsonData];
    
    self.results = [[ResultModel alloc]initWithDictionary:[downloader buildModels]];
}

-(void)runKeywordSearch
{
    SearchUrlBuilder *urlBuilder = [[SearchUrlBuilder alloc]init];
    urlBuilder.searchQuery = self.keyWordTextField.text;
    [urlBuilder buildKeyWordUrl];
    
    JSONDownloader *downloader = [[JSONDownloader alloc]initWithUrl:urlBuilder];
    [downloader downloadJsonData];
    
    self.results = [[ResultModel alloc]initWithDictionary:[downloader buildModels]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainScreenToPostcodeResultScreen"])
    {
        [self runPostcodeSearch];
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.results = self.results;        
    }
    else if ([segue.identifier isEqualToString:@"mainScreenToKeywordResultScreen"])
    {
        [self runKeywordSearch];
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.results = self.results;
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField
{
    [theTextField resignFirstResponder];
    return YES;
}
- (IBAction)segmentSwitch:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == POSTCODE_SEGMENT) {
        //toggle the correct view to be visible
        [self.geolocationButton setHidden:NO];
        [self.searchTextField setHidden:NO];
        [self.searchPostcodeButton setHidden:NO];
        self.promptLabel.text = @"Enter Postcode:";
        
        [self.searchKeywordButton setHidden:YES];
        [self.keyWordTextField setHidden:YES];
    }
    else
    {
        [self.geolocationButton setHidden:YES];
        [self.searchTextField setHidden:YES];
        [self.searchPostcodeButton setHidden:YES];
        self.promptLabel.text = @"Enter Place name:";
        
        [self.searchKeywordButton setHidden:NO];
        [self.keyWordTextField setHidden:NO];
    }
}

- (void)viewDidUnload
{
    [self setPromptLabel:nil];
    [super viewDidUnload];
    [self setGeolocationButton:nil];
    [self setSearchPostcodeButton:nil];
    [self setSearchKeywordButton:nil];
    [self setKeyWordTextField:nil];
    [self setSegmentControl:nil];
}
@end
