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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[MyMpLocationManager alloc] init];
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
           // [self.locationManager reverseGeoCode];
            self.searchTextField.text = self.locationManager.postCode;
            }];
        }];
}


@end
