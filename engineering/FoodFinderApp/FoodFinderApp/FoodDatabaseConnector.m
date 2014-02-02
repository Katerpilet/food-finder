//
//  FoodDatabaseConnector.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "FoodDatabaseConnector.h"

@implementation FoodDatabaseConnector
{
    NSMutableArray* _restaurauntList;
}

-(id)init
{
    self = [super init];
    _restaurauntList = [[NSMutableArray alloc] initWithCapacity:4];
    _restaurauntList[ 0 ] = [[Restauraunt alloc] initWithName:@"Blakes" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42b" globalRating:4 priceRating:1];
    _restaurauntList[ 1 ] = [[Restauraunt alloc] initWithName:@"Dustins" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42c" globalRating:3 priceRating:2];
    _restaurauntList[ 2 ] = [[Restauraunt alloc] initWithName:@"Joes" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42e" globalRating:2 priceRating:3];
    _restaurauntList[ 3 ] = [[Restauraunt alloc] initWithName:@"Matts" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42f" globalRating:1 priceRating:4];
    return self;
}
-(void) createRestaurauntObjects : (NSArray*) restauraunts
{
    _restaurauntList = [[NSMutableArray alloc] initWithCapacity:[restauraunts count]];
    NSDictionary* currentRestauraunt;
    for( int i = 0; i < [restauraunts count]; ++i )
    {
        currentRestauraunt = restauraunts[ i ];
        NSString* name = currentRestauraunt[@"name"];
        NSString* description = currentRestauraunt[@"description"];
        NSString* address = currentRestauraunt[@"location"];
        NSString* idFSRestauraunt = currentRestauraunt[@"id"];
        int globalRating = [ currentRestauraunt[@"rating"] intValue ];
        int priceRating = [ currentRestauraunt[@"price"][@"tier"] intValue];
        //_restaurauntList[ i ] = [[Restauraunt alloc] initWithName:<#(NSString *)#> description:<#(NSString *)#> address:<#(NSString *)#> idFSRestaraunt:(int) globalRating:<#(int)#> priceRating:<#(int)#>]
    }
}

-(NSArray*)getRestaurauntList
{
    return _restaurauntList;
}
@end
