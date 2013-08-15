//
//  MyMpLocationManager.h
//  MyMP
//
//  Created by James Owen on 14/08/2013.
//  Copyright (c) 2013 James Owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class MainScreenViewController, MyMpLocationManager;

@interface MyMpLocationManager : NSObject <CLLocationManagerDelegate>

//-(void)startLocationUpdates;
-(void)startLocationUpdatesWithCompletion:(void (^)(CLLocation *location, BOOL success, NSError *error))completion;
-(void)reverseGeoCodeWithCompletion:(void (^)(BOOL success, NSError *error))completion;
-(void)stopLocationUpdates;
//-(void)reverseGeoCode;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (nonatomic, strong) NSString *postCode;



@end
