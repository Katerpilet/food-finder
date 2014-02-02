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
    NSMutableArray* _menuList;
}

-(id)init
{
    self = [super init];
    _restaurauntList = [[NSMutableArray alloc] initWithCapacity:4];
    _restaurauntList[ 0 ] = [[Restauraunt alloc] initWithName:@"Blakes" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42b" globalRating:4 priceRating:1];
    _restaurauntList[ 1 ] = [[Restauraunt alloc] initWithName:@"Dustins" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42c" globalRating:3 priceRating:2];
    _restaurauntList[ 2 ] = [[Restauraunt alloc] initWithName:@"Joes" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42e" globalRating:2 priceRating:3];
    _restaurauntList[ 3 ] = [[Restauraunt alloc] initWithName:@"Matts" description:@"My Place" address:@"Kimball Dr" idFSRestaraunt:@"4ad42f" globalRating:1 priceRating:4];
    
    _menuList = [[NSMutableArray alloc] initWithCapacity:3];
    _menuList[ 0 ] = [[NSMutableArray alloc] initWithCapacity:2];
    _menuList[ 1 ] = [[NSMutableArray alloc] initWithCapacity:2];
    _menuList[ 2 ] = [[NSMutableArray alloc] initWithCapacity:2];
    
    _menuList[ 0 ][ 0 ] = @"Breakfast";
    _menuList[ 0 ][ 1 ] = [NSArray arrayWithObjects:@"Tortilla Soup", @"Avacado Chilli", nil];
    
    _menuList[ 1 ][ 0 ] = @"Lunch";
    _menuList[ 1 ][ 1 ] = [NSArray arrayWithObjects:@"Bacon Burger", @"Turnip Juice", @"Ribs", nil];
    
    _menuList[ 2 ][ 0 ] = @"Dinner";
    _menuList[ 2 ][ 1 ] = [NSArray arrayWithObjects:@"Steak", @"Meatballs", @"Pasghetii", nil];
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

-(NSArray*) getRestaurauntListWithUsername : (NSString*) username password : (NSString*) password latitude : (double)latitude longitude : (double)longitude
{
    NSMutableString *requestString = [NSMutableString stringWithString:DATABASE_URL_];
    requestString = [requestString stringByAppendingString:NEARBY_RESTAURANT_SCRIPT];
    
    NSString *parameters = [NSString stringWithFormat:@"?username=%@&password=%@&latitude=%f&longitude=%f", username, password, latitude, longitude];
    requestString = [requestString stringByAppendingString:parameters];
    NSString* returnString = [self getDataFrom:requestString];
    return _restaurauntList;
}

-(NSArray*) getMenu
{
    return _menuList;
}

-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
{
    NSMutableString *requestString = [NSMutableString stringWithString:DATABASE_URL_];
    requestString = [requestString stringByAppendingString:REGISTRATION_SCRIPT];
    
    NSString *parameters = [NSString stringWithFormat:@"?username=%@&password=%@", username, password];
    requestString = [requestString stringByAppendingString:parameters];
    int receivedData = [[self getDataFrom:requestString] intValue];
    
    
    return receivedData > 0;
}

-(BOOL)validateWithUsername:(NSString*) username andPassword: (NSString*) password
{
    NSMutableString *requestString = [NSMutableString stringWithString:DATABASE_URL_];
    requestString = [requestString stringByAppendingString:VALIDATE_USER_SCRIPT];
    
    NSString *parameters = [NSString stringWithFormat:@"?username=%@&password=%@", username, password];
    requestString = [requestString stringByAppendingString:parameters];
    int receivedData = [[self getDataFrom:requestString] intValue];
    
    
    return receivedData > 0;
}

//http://stackoverflow.com/questions/9404104/simple-objective-c-get-request
- (NSString *) getDataFrom:(NSString *)url
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}


@end
