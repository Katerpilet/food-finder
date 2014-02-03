//
//  Menu.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "Menu.h"

@implementation Menu
-(Menu*)initWithMenuItems : (NSString*)menuJson andRestaurantId : (NSString*)restarauntId;
{
    self = [super init];
    
    _restarauntId = restarauntId;
    if( menuJson )
    {
        NSData* responseStringAsData = [menuJson dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e;
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:responseStringAsData options:kNilOptions error:&e];
        
        NSArray* menuItemNodes = jsonData[ @"menuItemNodes" ];
        
        //If there is a menu node
        if ( ! [menuItemNodes isKindOfClass:[ NSNull class ] ] )
        {
            _menuItems = [[NSMutableArray alloc] initWithCapacity:[menuItemNodes count]];
            
            //Iterate through the menu nodes
            for( int i = 0; i < [menuItemNodes count]; ++i )
            {
                NSDictionary *currentChild = menuItemNodes[ i ];
                
                //Get the properties of the current child
                NSArray *subChildJson = currentChild[ @"children" ];
                NSString *childName = currentChild[@"name"];
                NSString *childDescription = currentChild[@"description"];
                NSString *childItemId = currentChild[@"idFSItem"];
                
                //If this is a root node
                if( subChildJson == nil || subChildJson == (id)[NSNull null])
                {
                    //Get the price of the menu
                    NSString* priceString = currentChild[@"price"];
                    int itemPrice = 0;
                    if( priceString != (id)[NSNull null])
                    {
                        itemPrice = [currentChild[@"price"] intValue];
                    }
                    
                    //Get the global rating
                    NSString* globalRatingString = currentChild[@"globalRating"];
                    int itemGlobalRating = 0;
                    if( globalRatingString != (id)[NSNull null] )
                    {
                        itemGlobalRating = [currentChild[@"globalRating"] intValue];
                    }
                    
                    //Check if it's a user menu item
                    NSString* userMenuItemString = currentChild[ @"idUserMenuItem" ];
                    if ( userMenuItemString && userMenuItemString != (id)[NSNull null ] )
                    {
                        int idUserMenuItem = [ userMenuItemString intValue ];
                        UserMenuItem * userMenuItem = [[UserMenuItem alloc] init ];
                        [ userMenuItem initWithJSON:currentChild ];
                        _menuItems[ i ] = userMenuItem;
                    }
                    else
                    {
                        _menuItems[ i ] = [[MenuItem alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId price:itemPrice globalRating:itemGlobalRating];
                    }
                }
                else
                {
                    _menuItems[ i ] = [[MenuItemNode alloc] initWithChildrenJson:subChildJson name:childName description:childDescription itemId:childItemId];
                }
            }
        }
    }
    
    return self;
}
@end
