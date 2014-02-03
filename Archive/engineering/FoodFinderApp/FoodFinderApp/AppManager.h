//
//  AppManager.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFoodDatabaseConnector.h"
#import "FoursquareConnector.h"
#import <CoreLocation/CoreLocation.h>
#import "PAppManager.h"
#import "FoodDatabaseConnector.h"


static const CLLocationDistance DISTANCE_FILTER_CHANGE = 100.0;
@interface AppManager : NSObject<FoodDatabaseConnector, PAppManager>

-(id) init;
-(void) getStuff;
-(NSArray*) getRestaurauntList;
-(NSArray*) searchForRestaurants : (NSString*) searchTerm;
-(Menu*) getMenuWithRestaurantId : (NSString*) idFSRestaurant;
-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
-(BOOL)validateWithUsername:(NSString*) username andPassword: (NSString*) password;
-(NSArray*) getRestaurantList;
-(void) setRestaurantRating : (NSString *) idFSRestaurant : (int) rating;
-(void) setRestaurantComments: (NSString*) idFSRestaurant  : (NSString *) comments;
-(BOOL) orderedMenuItem: (NSString *) idFSRestaurant : (NSString *) idFSMenuItem : (int) rating;
-(void) setMenuItemComments:(NSString*)idFSRestaurantItem : (NSString*)idFSMenuItem : (NSString*)comments;
-(void) awardAchievement: (int) idAchievement;
-(NSMutableArray *) getAchievements;


@end
