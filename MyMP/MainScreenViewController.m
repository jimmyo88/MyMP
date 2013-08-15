//
//  ViewController.m
//  MyMP
//
//  Created by James Owen on 13/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "MainScreenViewController.h"
#import <MapKit/MapKit.h>

@interface MainScreenViewController ()
@end


@implementation MainScreenViewController
@synthesize locationManager = _locationManager,searchTextField = _searchTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[MyMpLocationManager alloc] init];
    self.locationManager.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)geolocationButtonPressed:(UIButton *)sender
{
    self.searchTextField.placeholder = @"Getting Location";
    [self.locationManager startLocationUpdatesWithCompletion:^(CLLocation *location, BOOL success, NSError *error) {
        self.searchTextField.text = @"Current location";
    }];
}

#pragma mark - MyMpLocationManagerDelegate
- (void)myMpLocationManager:(MyMpLocationManager *)manager didUpdateToLocation:(CLLocation *)location
{
    self.searchTextField.text = @"...";
}

@end
