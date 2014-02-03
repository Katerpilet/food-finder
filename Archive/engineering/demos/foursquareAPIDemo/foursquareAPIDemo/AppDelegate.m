//
//  AppDelegate.m
//  foursquareAPIDemo
//
//  Created by Student on 1/30/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    CLLocationManager* _locationManager;
    CLLocationDegrees _latitude, _longitude;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self startLocationUpdate]; // first figure out location
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) foursquareConnectionTest;
{
    NSString* connectionString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?client_id=2EHUQ3D3IZTDR0IWNUERMDBBTNFQN4ZC5FHCHUFOK4C4DUQR&client_secret=O2PYVKLQ0CSPMA143QDGNKLOZXUCY5MZDDSKWDZKP02XRZFE&v=20130815&ll=%f,%f&categoryId=4d4b7105d754a06374d81259", _latitude, _longitude];
    
   // NSLog( @"%@", [self getDataFrom:connectionString ] );
    
    NSString* dataString = [self getDataFrom:connectionString];
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError* e = nil;
    NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&e];
    
    if( e )
    {
        NSLog(@"Error: %@", e);
    }
    else{
        NSArray* jsonVenues = jsonData[@"response"][@"venues"];
        for( int i = 0; i < jsonVenues.count; ++i )
        {
            NSLog(@"Venue %i info %@", i, jsonVenues[ i ][@"name"]);
        }
        //NSLog(@"Json output: %@", jsonVenues);
    }
}

- (NSString *) getDataFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

- (void) startLocationUpdate
{
    if( !_locationManager )
    {
        _locationManager = [[CLLocationManager alloc] init];
    }
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 100;  // how often new events should occur
    
    [_locationManager startUpdatingLocation];
}

- (void) locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray *)locations;
{
    CLLocation* location = [locations lastObject];
    NSLog(@"Lat/Lon: %f, %f", location.coordinate.latitude, location.coordinate.longitude);
    [_locationManager stopUpdatingLocation];
    
    _latitude = location.coordinate.latitude;
    _longitude = location.coordinate.longitude;
    
    // then query for location
    [self foursquareConnectionTest];
}
@end
