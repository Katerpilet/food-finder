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
-(NSArray*) getMenu;


@end
