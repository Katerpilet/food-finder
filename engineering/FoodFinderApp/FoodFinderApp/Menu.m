//
//  Menu.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "Menu.h"

@implementation Menu
-(Menu*)initWithMenuItems : (NSString*) menuJson
{
    self = [super init];
    
    if( menuJson )
    {
        NSData* responseStringAsData = [menuJson dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e;
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:responseStringAsData options:kNilOptions error:&e];
        
        NSArray* menuItemNodes = jsonData[ @"menuItemNodes" ];
        _menuItems = [[NSMutableArray alloc] initWithCapacity:[menuItemNodes count]];
        for( int i = 0; i < [menuItemNodes count]; ++i )
        {
            NSDictionary *currentChild = menuItemNodes[ i ];
            
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
                
                _menuItems[ i ] = [[MenuItem alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId price:itemPrice globalRating:itemGlobalRating];
            }
            else
            {
                _menuItems[ i ] = [[MenuItemNode alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId];
            }
            
        }
    }
    
    return self;
}
@end
