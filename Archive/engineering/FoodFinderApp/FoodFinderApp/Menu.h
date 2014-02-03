//
//  Menu.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"
#import "UserMenuItem.h"

@interface Menu : NSObject
@property (nonatomic, strong) NSMutableArray *menuItems;
@property (nonatomic, strong) NSString* restarauntId;
-(Menu*)initWithMenuItems : (NSString*)menuJson andRestaurantId : (NSString*)restarauntId;
@end
