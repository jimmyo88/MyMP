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

@property (nonatomic, strong) MyMpLocationManager *locationManager;

@end

@implementation MainScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[MyMpLocationManager alloc] init];
    self.searchTextField.delegate = self;
    self.keyWordTextField.delegate = self;
}

- (void)viewDidUnload
{
    [self setPromptLabel:nil];
    [self setGeolocationButton:nil];
    [self setSearchPostcodeButton:nil];
    [self setSearchKeywordButton:nil];
    [self setKeyWordTextField:nil];
    [self setSegmentControl:nil];
    
    [super viewDidUnload];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainScreenToPostcodeResultScreen"])
    {
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.searchText = self.searchTextField.text;
    }
    else if ([segue.identifier isEqualToString:@"mainScreenToKeywordResultScreen"])
    {
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.searchText = self.keyWordTextField.text;
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = -50;
        self.view.frame = frame;
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    [theTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    }];
    
    return YES;
}

#pragma mark - Button actions

- (IBAction)segmentSwitch:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == POSTCODE_SEGMENT)
    {
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

@end
