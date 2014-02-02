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
    
    NSArray* restaurauntArray = [_foursquareConnector getRestaurauntListWithLongitude:_longitude andLatitude:_latitude];
    NSLog(@"Restauraunts: %@", restaurauntArray);
    
    NSDictionary* menus = [_foursquareConnector getMenuFromRestauraunt: restaurauntArray[ 1 ][@"id"] ];
    
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
    return [_foodDatabaseConnector getRestaurauntList];
}
@end
