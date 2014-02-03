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
-(BOOL) validateUser : (NSString*) username : (NSString*) password;
-(NSMutableArray*) getRestaurantList : (NSString*) username: (NSString*) password: (double)latitude: (double)longitude;
-(NSMutableArray*) searchForRestaurants : (NSString*) username : (NSString*) password : (double) latitude : (double) longitude : (NSString*) searchTerm;
-(Menu*) getRestaurantMenu : (NSString*) username : (NSString*) password : (NSString*) idFSRestaurant;
-(void) setRestaurantRating : (NSString *) username : (NSString *) password : (NSString*) idFSRestaurant : (int) rating;
-(void) setRestaurantComments : (NSString *) username : (NSString *) password : (NSString*) idFSRestaurant : (NSString*) comments;
-(void) orderedMenuItem : (NSString *) username : (NSString *) password : (NSString *) idFSRestaurant : (NSString *) idFSMenuItem : (int) rating;
-(void) setMenuItemComments : (NSString *) username : (NSString *) password : (NSString *) idFSRestaurant : (NSString *) idFSMenuItem : (NSString *) comments;
-(void) awardAchievement : (NSString *) username : (NSString *)  password : (int) idAchievement;
-(NSMutableArray *) getAchievements : (NSString *) username : (NSString *) password;
-(NSString *) callPHPScript : (NSString*) scriptName : (NSDictionary*) getParams;
- (NSString *) getDataFrom:(NSString *)url;
@end
