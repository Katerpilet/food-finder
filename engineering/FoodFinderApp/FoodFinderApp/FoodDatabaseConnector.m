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
@end
