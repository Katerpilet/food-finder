//
//  Restauraunt.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant
-(Restaurant*) initWithName:(NSString*)name description : (NSString*)description address : (NSString*)address idFSRestaraunt : (NSString*) idFSRestauraunt globalRating : (int) globalRating priceRating : (int) priceRating
{
    self = [super self];
    
    _name = name;
    _address = address;
    _idFSRestaurant = idFSRestauraunt;
    _globalRating = globalRating;
    _priceRating = priceRating;
    
    return self;
}

-(void) initWithJSON:(NSDictionary*) jsonDictionary
{
    if ( ! [ jsonDictionary[@"idFSRestaurant" ] isKindOfClass:[ NSNull class ] ] )
    {
        _idFSRestaurant = jsonDictionary[ @"idFSRestaurant" ];
    }
    if ( ! [ jsonDictionary[@"name" ] isKindOfClass:[ NSNull class ] ] )
    {
        _name = jsonDictionary[ @"name" ];
    }
    if ( ! [ jsonDictionary[@"address" ] isKindOfClass:[ NSNull class ] ] )
    {
        _address = jsonDictionary[ @"address" ];
    }
    if ( ! [ jsonDictionary[@"userComments" ] isKindOfClass:[ NSNull class ] ] )
    {
        _userComments = jsonDictionary[ @"userComments" ];
    }
    if ( ! [ jsonDictionary[@"idUserRestaurant" ] isKindOfClass:[ NSNull class ] ] )
    {
        _idUserRestaurant = [ jsonDictionary[ @"idUserRestaurant" ] intValue ];
    }
    if ( ! [ jsonDictionary[@"globalRating" ] isKindOfClass:[ NSNull class ] ] )
    {
        _globalRating = [ jsonDictionary[ @"globalRating" ] intValue ];
    }
    if ( ! [ jsonDictionary[@"priceRating" ] isKindOfClass:[ NSNull class ] ] )
    {
        _priceRating = [ jsonDictionary[ @"priceRating" ] intValue ];
    }
    if ( ! [ jsonDictionary[@"userRating" ] isKindOfClass:[ NSNull class ] ] )
    {
        _userRating = [ jsonDictionary[ @"userRating" ] intValue ];
    }
}
@end
