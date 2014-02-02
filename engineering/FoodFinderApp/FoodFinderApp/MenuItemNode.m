//
//  MenuItemNode.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "MenuItemNode.h"
#import "MenuItem.h"

@class MenuItem;

@implementation MenuItemNode
-(MenuItemNode*)initWithChildrenJson : (NSArray*) childrenJson name : (NSString*) name description : (NSString*) description itemId : (NSString*) idFSItem;
{
    self = [super init];
    _name = name;
    _description = description;
    _idFSItem = idFSItem;
    
    if( childrenJson != nil && childrenJson != (id)[NSNull null])
    {
        _children = [[NSMutableArray alloc] initWithCapacity:[childrenJson count]];
        
        for( int i = 0; i < [childrenJson count]; ++i )
        {
            NSDictionary *currentChild = childrenJson[ i ];
            
            NSArray *subChildJson = currentChild[ @"children" ];
            NSString *childName = currentChild[@"name"];
            NSString *childDescription = currentChild[@"description"];
            NSString *childItemId = currentChild[@"idFSItem"];
            
            
            if( subChildJson == nil || subChildJson == (id)[NSNull null])
            {
                NSString* priceString = currentChild[@"price"];
                int itemPrice = 0;
                if( priceString != (id)[NSNull null])
                {
                     itemPrice = [currentChild[@"price"] intValue];
                }
                NSString* globalRatingString = currentChild[@"globalRating"];
                int itemGlobalRating = 0;
                if( globalRatingString != (id)[NSNull null] )
                {
                    itemGlobalRating = [currentChild[@"globalRating"] intValue];
                }

                _children[ i ] = [[MenuItem alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId price:itemPrice globalRating:itemGlobalRating];
            }
            else
            {
                _children[ i ] = [[MenuItemNode alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId];
            }
            
        }
    }
    
    return self;
}
@end
