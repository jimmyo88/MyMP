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
}

- (void)viewDidUnload
{
    [self setGeolocationButton:nil];
    [self setSearchKeywordButton:nil];
    
    [super viewDidUnload];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainScreenToResultScreen"])
    {
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.searchText = self.searchTextField.text;
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
