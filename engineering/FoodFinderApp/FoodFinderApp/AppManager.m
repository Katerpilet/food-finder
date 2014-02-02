//
//  AppManager.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager
{
    FoursquareConnector* _foursquareConnector;
    FoodDatabaseConnector* _foodDatabaseConnector;
    CLLocationManager* _locationManager;
    CLLocationDegrees _latitude, _longitude;
    NSString *_userName, *_password;
}
/**************** LOCATION SETUP ****************/
-(void) initLocationDelegate
{
    if( !_locationManager )
    {
        _locationManager = [[CLLocationManager alloc] init];
    }
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = DISTANCE_FILTER_CHANGE;
    
    [_locationManager startUpdatingLocation];
}

- (void) locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* location = [locations lastObject];
    NSLog(@"Lat/Lon Updated: %f, %f", location.coordinate.latitude, location.coordinate.longitude);

    _latitude = location.coordinate.latitude;
    _longitude = location.coordinate.longitude;
    
}

-(id) init
{
    self = [super init];
    _foursquareConnector = [[FoursquareConnector alloc] init];
    _foodDatabaseConnector = [[FoodDatabaseConnector alloc ] init];
    [self initLocationDelegate];
    
    
    return self;
}

-(void) getStuff
{
    NSLog(@"Worked");
}

-(NSArray*) getRestaurauntList
{
    return [_foodDatabaseConnector getRestaurauntListWithUsername:_userName password:_password latitude:_latitude longitude:_longitude];
}

-(NSArray*) getMenuWithRestaurantId : (NSString*) idFSRestaurant;
{
    return [_foodDatabaseConnector getMenuWithUsername:_userName password:_password restaurantID:idFSRestaurant];
}

-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
{
    _userName = username;
    _password = password;
    return [_foodDatabaseConnector registerWithUsernameAndPassword:username:password];
}

-(BOOL)validateWithUsername:(NSString*) username andPassword: (NSString*) password
{
    _userName = username;
    _password = password;
    return [_foodDatabaseConnector validateWithUsernameAndPassword:username:password];
}
@end
