//
//  FoodDatabaseConnector.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "FoodDatabaseConnector.h"

@implementation FoodDatabaseConnector

-(BOOL) registerUser : (NSString*) username : (NSString*) password;
{
    NSDictionary *getParams =
    @{
      @"username" : username,
      @"password" : password
      };
    
    NSString *recievedData = [self callPHPScript:@"registerUser" :getParams];
    
    return [recievedData isEqualToString:@"1"];
}

-(BOOL)validateUser:(NSString*) username : (NSString*) password
{
    NSDictionary *getParams =
    @{
      @"username" : username,
      @"password" : password
      };
    
    NSString *recievedData = [self callPHPScript:@"validateUser" :getParams];
    
    return [recievedData isEqualToString:@"1"];
}

-(NSMutableArray*) getRestaurantList:(NSString*)username:(NSString*)password:(double)latitude: (double)longitude
{
    NSMutableArray * restaurantList = [[NSMutableArray alloc ] init];
    
    NSString * latString = [ [ NSNumber numberWithDouble: latitude ] stringValue ];
    NSString * longString = [ [ NSNumber numberWithDouble : longitude ] stringValue ];
    
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"latitude" : latString,
      @"longitude" : longString
      };
    
    NSString *recievedData = [self callPHPScript:@"getNearbyRestaurants" :getParams];
    
    if ( ! [recievedData isEqualToString:@"-1"])
    {
        
        NSData * jsonData = [recievedData dataUsingEncoding:NSUTF8StringEncoding];
        NSError * e;
        NSArray * jsonRestaurantList = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&e];
        
        for( int i = 0; i < [jsonRestaurantList count]; ++i)
        {
            NSDictionary * curRestaurantJSON = jsonRestaurantList[ i ];
            
            Restaurant * restaurant = [[Restaurant alloc] init];
            [restaurant initWithJSON:curRestaurantJSON];
            [restaurantList addObject:restaurant];
        }
    }
    
    return restaurantList;
}

-(NSMutableArray*) searchForRestaurants : (NSString*) username : (NSString*) password : (double) latitude : (double) longitude : (NSString*) searchTerm;
{
    NSMutableArray * restaurantList = [[NSMutableArray alloc ] init];
    
    NSString * latString = [ [ NSNumber numberWithDouble: latitude ] stringValue ];
    NSString * longString = [ [ NSNumber numberWithDouble : longitude ] stringValue ];
    NSString * location = [NSString stringWithFormat:@"%@,%@", latString, longString];
    
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"location" : location,
      @"searchTerm" : searchTerm
      };
    
    NSString *recievedData = [self callPHPScript:@"searchForRestaurant" :getParams];
    
    if ( ! [recievedData isEqualToString:@"-1"])
    {
        
        NSData * jsonData = [recievedData dataUsingEncoding:NSUTF8StringEncoding];
        NSError * e;
        NSArray * jsonRestaurantList = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&e];
        
        for( int i = 0; i < [jsonRestaurantList count]; ++i)
        {
            NSDictionary * curRestaurantJSON = jsonRestaurantList[ i ];
            
            Restaurant * restaurant = [[Restaurant alloc] init];
            [restaurant initWithJSON:curRestaurantJSON];
            [restaurantList addObject:restaurant];
        }
    }
    
    return restaurantList;
}

-(Menu*) getRestaurantMenu : (NSString*) username : (NSString*) password : (NSString*) idFSRestaurant
{
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"idFSRestaurant" : idFSRestaurant
      };
    
    NSString *responseString = [self callPHPScript:@"getRestaurantMenu" :getParams];
    
    Menu *menu = [[Menu alloc] initWithMenuItems:responseString];
    return menu;
}

-(void) setRestaurantRating : (NSString *) username : (NSString *) password : (NSString*) idFSRestaurant : (int) rating
{
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"idFSRestaurant" : idFSRestaurant,
      @"rating" : [ NSString stringWithFormat: @"%d", rating]
      };
    
    [self callPHPScript:@"setRestaurantRating" :getParams];
}

-(void) setRestaurantComments : (NSString *) username : (NSString *) password : (NSString*) idFSRestaurant : (NSString*) comments
{
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"idFSRestaurant" : idFSRestaurant,
      @"comments" : comments
      };
    
    [self callPHPScript:@"setRestaurantComments" :getParams];
}

-(void) orderedMenuItem : (NSString *) username : (NSString *) password : (NSString *) idFSRestaurant : (NSString *) idFSMenuItem :(int) rating
{
    NSDictionary * getParams =
    @{
      @"username" : username,
      @"password" : password,
      @"idFSMenuItem" : idFSMenuItem,
      @"idFSRestaurant" : idFSRestaurant,
      @"rating" : [NSString stringWithFormat: @"%d", rating]
      };
    
    [self callPHPScript:@"orderedMenuItem" :getParams];
}


- (NSString *) callPHPScript : (NSString *)scriptName : (NSDictionary *) getParams
{
    //Initialize to [url].php
    NSString *requestString = [NSString stringWithFormat:@"%@script.%@.php", DATABASE_URL_, scriptName];
    
    //Add [url].php? if there are get params
    if ( getParams.count > 0 )
    {
        requestString = [NSString stringWithFormat:@"%@?", requestString];
    }
    
    //Append the get params
    for( id key in getParams )
    {
        requestString = [NSString stringWithFormat:@"%@%@=%@&", requestString, key, [getParams objectForKey:( key ) ] ];
    }
    
    //Remove the last ampersand
    requestString = [ requestString substringWithRange:NSMakeRange(0, [requestString length] - 1 ) ];
    
    //Call the script and get the response
    return [ self getDataFrom: requestString ];
}

//http://stackoverflow.com/questions/9404104/simple-objective-c-get-request
- (NSString *) getDataFrom:(NSString *)url
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200)
    {
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}


@end
