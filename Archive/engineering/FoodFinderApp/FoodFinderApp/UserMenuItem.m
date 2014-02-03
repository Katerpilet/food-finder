//
//  UserMenuItem.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "UserMenuItem.h"

@implementation UserMenuItem

-(void)initWithJSON : (NSDictionary *) json
{
    if ( ! [ json[@"idUserMenuItem" ] isKindOfClass:[ NSNull class ] ] )
    {
        _idUserMenuItem = [json[ @"idUserMenuItem" ] intValue];
    }
    if ( ! [ json[@"comments" ] isKindOfClass:[ NSNull class ] ] )
    {
        _comments = json[ @"comments" ];
    }
    
    //Get the user rating
    if ( json[@"orders" ] )
    {
        NSArray * orders = json[ @"orders" ];
        
        double sum = 0;
        int count = 0;
        
        //Iterate through the orders and get the average rating
        for ( int i = 0; i < [orders count]; ++i )
        {
            NSDictionary *order = orders[ i ];
            
            if ( order[ @"userRating"] && ! [ order[@"userRating" ] isKindOfClass:[ NSNull class ] ] )
            {
                int userRating = [ order[ @"userRating" ] intValue ];
                sum += userRating;
                ++count;
            }
        }
        
        sum /= count;
        _userRating = round( sum );
    }
}


@end
