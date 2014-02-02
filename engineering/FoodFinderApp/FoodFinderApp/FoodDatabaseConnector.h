//
//  FoodDatabaseConnector.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFoodDatabaseConnector.h"
#import "Restauraunt.h"
#import "Menu.h"

static  NSString* DATABASE_URL_ = @"http://ec2-54-235-249-205.compute-1.amazonaws.com/foodfinder/";
static  NSString* REGISTRATION_SCRIPT = @"script.registerUser.php";
static  NSString* VALIDATE_USER_SCRIPT = @"script.validateUser.php";
static  NSString* NEARBY_RESTAURANT_SCRIPT = @"script.getNearbyRestaurants.php";

@interface FoodDatabaseConnector : NSObject<FoodDatabaseConnector>
-(void) createRestaurauntObjects : (NSArray*) restauraunts;
-(void) createMenuObject : (NSDictionary*) menu;
-(NSArray*) getRestaurauntListWithUsername : (NSString*) username password : (NSString*) password latitude : (double)latitude longitude : (double)longitude;
-(NSArray*) getMenu;
- (NSString *) getDataFrom:(NSString *)url;
-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
@end
