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

-(NSArray*) searchForRestaurants:(NSString *)searchTerm
{
    return [_foodDatabaseConnector searchForRestaurants:_userName :_password :_latitude :_longitude :searchTerm ];
}

-(NSArray*) getRestaurauntList
{
    return [_foodDatabaseConnector getRestaurantList:_userName :_password :_latitude :_longitude];
}

-(Menu*) getMenuWithRestaurantId : (NSString*) idFSRestaurant;
{
    return [_foodDatabaseConnector getRestaurantMenu: _userName: _password: idFSRestaurant];
}

-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
{
    _userName = username;
    _password = password;
    return [_foodDatabaseConnector registerUser:username:password];
}

-(BOOL)validateWithUsername:(NSString*) username andPassword: (NSString*) password
{
    _userName = username;
    _password = password;
    return [_foodDatabaseConnector validateUser:username:password];
}

-(void) setRestaurantRating : (NSString *) idFSRestaurant : (int) rating
{
    [_foodDatabaseConnector setRestaurantRating: _userName : _password : idFSRestaurant : rating ];
}

-(void) setRestaurantComments: (NSString*) idFSRestaurant : (NSString *) comments
{
    [_foodDatabaseConnector setRestaurantComments: _userName : _password : idFSRestaurant : comments];
}

-(void) orderedMenuItem: (NSString *) idFSRestaurant : (NSString *) idFSMenuItem : (int) rating
{
    [_foodDatabaseConnector orderedMenuItem: _userName : _password : idFSRestaurant : idFSMenuItem : rating ];
}

-(void) awardAchievement: (int) idAchievement
{
    [_foodDatabaseConnector awardAchievement: _userName : _password : idAchievement ];
}

-(NSMutableArray *) getAchievements
{
    return [_foodDatabaseConnector getAchievements: _userName : _password];
}
@end
