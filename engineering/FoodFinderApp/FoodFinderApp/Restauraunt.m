//
//  Restauraunt.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "Restauraunt.h"

@implementation Restauraunt
-(Restauraunt*) initWithName:(NSString*)name description : (NSString*)description address : (NSString*)address idFSRestaraunt : (NSString*) idFSRestauraunt globalRating : (int) globalRating priceRating : (int) priceRating
{
    self = [super self];
    
    _name = name;
    _address = address;
    _idFSRestauraunt = idFSRestauraunt;
    _globalRating = globalRating;
    _priceRating = priceRating;
    
    return self;
}
@end
