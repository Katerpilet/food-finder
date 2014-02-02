//
//  MenuItem.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "MenuItemNode.h"

@interface MenuItem : MenuItemNode
@property (nonatomic) int price;
@property (nonatomic) int globalRating;

-(MenuItemNode*)initWithChildrenJson : (NSArray*) childrenJson name : (NSString*) name description : (NSString*) description itemId : (NSString*) idFSItem price : (int) price globalRating : (int) globalRating;
@end
