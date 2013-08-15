//
//  MyMpLocationManager.m
//  MyMP
//
//  Created by James Owen on 14/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import "MyMpLocationManager.h"
#import "MainScreenViewController.h"
#import "AppDelegate.h"

@interface MyMpLocationManager ()

@property (nonatomic, copy) void (^completionBlock)(CLLocation *location, BOOL success, NSError *error);

@end

@implementation MyMpLocationManager

-(id)init
{
    self = [super init];
    if(self)
    {
        _locationManager = [[CLLocationManager alloc]init];
        _currentLocation = [[CLLocation alloc]init];
        _geoCoder = [[CLGeocoder alloc]init];
        _locationManager.delegate = self;
    }
    return self;
}

-(void)startLocationUpdates
{
    self.completionBlock = nil;
    [_locationManager startMonitoringSignificantLocationChanges];
    [_locationManager startUpdatingLocation];
}

-(void)startLocationUpdatesWithCompletion:(void (^)(CLLocation *location, BOOL success, NSError *error))completion
{
    self.completionBlock = completion;
    [_locationManager startMonitoringSignificantLocationChanges];
    [_locationManager startUpdatingLocation];
}

-(void)stopLocationUpdates
{
    [_locationManager stopMonitoringSignificantLocationChanges];
    [_locationManager stopUpdatingLocation];
}

- (void)reverseGeoCode
{
[_geoCoder reverseGeocodeLocation: _locationManager.location completionHandler:
 ^(NSArray *placemarks, NSError *error)
    {
    CLPlacemark *placemark = [placemarks objectAtIndex:0];
    _postCode = placemark.postalCode;
    }];
}

#pragma mark - Delegate Methods
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    _currentLocation = newLocation;
    [self stopLocationUpdates];
    [self.delegate myMpLocationManager:self didUpdateToLocation:newLocation];
    
    if(self.completionBlock)
    {
        self.completionBlock(newLocation, YES, nil);
    }
}
 

@end
