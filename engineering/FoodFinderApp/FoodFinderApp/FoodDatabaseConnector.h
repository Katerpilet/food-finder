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

static const NSString* DATABASE_URL_ = @"http://ec2-54-235-249-205.compute-1.amazonaws.com/foodfinder/";
static const NSString* REGISTRATION_SCRIPT = @"script.registerUser.php";
static const NSString* VALIDATE_USER_SCRIPT = @"script.validateUser.php";

@interface FoodDatabaseConnector : NSObject<FoodDatabaseConnector>
-(void) createRestaurauntObjects : (NSArray*) restauraunts;
-(void) createMenuObject : (NSDictionary*) menu;
-(NSArray*) getRestaurauntList;
-(NSArray*) getMenu;
- (NSString *) getDataFrom:(NSString *)url;
-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
@end
