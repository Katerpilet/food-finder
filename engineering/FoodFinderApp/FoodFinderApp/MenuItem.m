//
//  MenuItem.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

-(MenuItemNode*)initWithChildrenJson : (NSArray*) childrenJson name : (NSString*) name description : (NSString*) description itemId : (NSString*) idFSItem price : (int) price globalRating : (int) globalRating
{
    self = [super initWithChildrenJson:childrenJson name:name description:description itemId:idFSItem];
    _price = price;
    _globalRating = globalRating;
    return self;
}

@end
