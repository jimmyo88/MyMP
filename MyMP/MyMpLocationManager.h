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

@protocol MyMpLocationManagerDelegate <NSObject>

@required
- (void)myMpLocationManager:(MyMpLocationManager *)manager didUpdateToLocation:(CLLocation *)location;

@end

@interface MyMpLocationManager : NSObject <CLLocationManagerDelegate>

-(void)startLocationUpdates;
-(void)startLocationUpdatesWithCompletion:(void (^)(CLLocation *location, BOOL success, NSError *error))completion;
-(void)stopLocationUpdates;
//-(void)printLocation;
-(void)reverseGeoCode;
//-(void)updateUI;

@property (nonatomic, weak) id <MyMpLocationManagerDelegate> delegate;
@property (nonatomic, strong, readonly) CLLocationManager *locationManager;
@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (nonatomic, strong) NSString *postCode;



@end
