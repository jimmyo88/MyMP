//
//  MyMpLocationManager.m
//  MyMP
//
//  Created by James Owen on 14/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//
#import "SearchURLBuilder.h"
#import "MyMpLocationManager.h"
#import "MainScreenViewController.h"
#import "AppDelegate.h"

@interface MyMpLocationManager ()

@property (nonatomic, copy) void (^completionBlock)(CLLocation *location, BOOL success, NSError *error);
@property (nonatomic, copy) void (^geoCodeCompletionBlock)(BOOL success, NSError *error);
@end

@implementation MyMpLocationManager

-(id)init
{
    self = [super init];
    if(self)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.currentLocation = [[CLLocation alloc] init];
        self.geoCoder = [[CLGeocoder alloc]init];
        self.locationManager.delegate = self;
    }
    return self;
}

-(void)startLocationUpdatesWithCompletion:(void (^)(CLLocation *location, BOOL success, NSError *error))completion
{
    self.completionBlock = completion;
    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

-(void)stopLocationUpdates
{
    self.completionBlock = nil;
    self.geoCodeCompletionBlock = nil;
    [self.locationManager stopMonitoringSignificantLocationChanges];
    [self.locationManager stopUpdatingLocation];
}

- (void)reverseGeoCodeWithCompletion:(void (^)(BOOL success, NSError *error))completion
{
    self.geoCodeCompletionBlock = completion;
    [self.geoCoder reverseGeocodeLocation: self.locationManager.location completionHandler:
     ^(NSArray *placemarks, NSError *error)
     {
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         self.postCode = placemark.postalCode;
         if(self.geoCodeCompletionBlock)
         {
             self.geoCodeCompletionBlock(YES, nil);
         }
     }];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;    
    if(self.completionBlock)
    {
        self.completionBlock(newLocation, YES, nil);
    }
}

-(NSString *)truncatePostcodeAndRemoveWhiteSpace
{
    self.postCode = [self.postCode substringToIndex: MIN(4, [self.postCode length])];
    return self.postCode;
}

@end
