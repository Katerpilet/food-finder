//
//  FoodDatabaseConnector.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFoodDatabaseConnector.h"
#import "Restaurant.h"
#import "Menu.h"

static  NSString* DATABASE_URL_ = @"http://ec2-54-235-249-205.compute-1.amazonaws.com/foodfinder/";
static  NSString* REGISTRATION_SCRIPT = @"script.registerUser.php";
static  NSString* VALIDATE_USER_SCRIPT = @"script.validateUser.php";
static  NSString* NEARBY_RESTAURANT_SCRIPT = @"script.getNearbyRestaurants.php";
static  NSString* MENU_SCRIPT = @"script.getRestaurantMenu.php";

@interface FoodDatabaseConnector : NSObject<FoodDatabaseConnector>
-(void) createMenuObject : (NSDictionary*) menu;
-(BOOL) registerUser : (NSString*) username : (NSString*) password;
-(BOOL)validateUser:(NSString*) username : (NSString*) password;
-(NSMutableArray*) getRestaurauntList:(NSString*)username:(NSString*)password:(double)latitude: (double)longitude;
-(NSArray*) getMenuWithUsername : (NSString*) username password : (NSString*) password restaurantID : (NSString*) idFSRestaurant;
-(NSString *) callPHPScript : (NSString *)scriptName : (NSDictionary *) getParams;
-(NSString *) getDataFrom:(NSString *)url;
@end
