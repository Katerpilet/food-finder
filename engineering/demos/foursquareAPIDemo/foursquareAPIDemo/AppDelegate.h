//
//  AppDelegate.h
//  foursquareAPIDemo
//
//  Created by Student on 1/30/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void) foursquareConnectionTest;
- (NSString *) getDataFrom:(NSString *)url; //http://stackoverflow.com/questions/9404104/simple-objective-c-get-request

- (void) startLocationUpdate;
- (void) locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray *)locations;
@end
