//
//  UserMenuItem.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "MenuItem.h"

@interface UserMenuItem : MenuItem
@property (nonatomic, strong) NSArray *orders;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic) int idUserMenuItem;
@property (nonatomic) int userRating;

-(void)initWithJSON : (NSDictionary *) json;
@end
