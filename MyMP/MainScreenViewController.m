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

@interface MainScreenViewController ()
@property NSMutableDictionary *json;
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
            self.searchTextField.text = self.locationManager.postCode;
            }];
        }];
}

- (IBAction)runSearch:(id)sender
{
    SearchUrlBuilder *urlBuilder = [[SearchUrlBuilder alloc]init];
    urlBuilder.searchQuery = self.searchTextField.text;
    [urlBuilder buildPostCodeUrl];
    
    JSONDownloader *downloader = [[JSONDownloader alloc]initWithUrl:urlBuilder];
    [downloader downloadJsonData];

    self.results = [[ResultModel alloc]initWithDictionary:[downloader buildModels]];
    
    [self performSegueWithIdentifier:@"mainScreenToResultScreen" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainScreenToResultScreen"])
    {
        ResultScreenViewController *resultVC = segue.destinationViewController;
        resultVC.results = self.results;        
    }
}


@end
