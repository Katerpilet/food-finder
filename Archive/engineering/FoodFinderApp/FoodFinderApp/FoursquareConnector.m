//
//  FoursquareConnector.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "FoursquareConnector.h"

@implementation FoursquareConnector

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

-(NSArray*) getRestaurauntListWithLongitude : (double) longitude andLatitude: (double) latitude
{
    NSString* fullConnectionString = [NSString stringWithString:CONNECTION_STRING_HEADER];
    fullConnectionString = [fullConnectionString stringByAppendingString:[NSString stringWithFormat:@"&ll=%f,%f&categoryId=%@", latitude, longitude, FOURSQUARE_FOOD_CATEGORY]];
    NSString* responseString = [self getDataFrom:fullConnectionString];
    if( responseString )
    {
        NSData* responseStringAsData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e;
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:responseStringAsData options:kNilOptions error:&e];
    
        if( e )
        {
            NSLog(@"Foursquare DB Error: %@", e);
        }
        else
        {
            return jsonData[@"response"][@"venues"];
        }
    }
    
    return nil; // if there was an error getting data
}

-(NSDictionary*) getMenuFromRestauraunt : (NSString*) restaurauntId
{
    NSString* menuQueryString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@/menu?client_id=2EHUQ3D3IZTDR0IWNUERMDBBTNFQN4ZC5FHCHUFOK4C4DUQR&client_secret=O2PYVKLQ0CSPMA143QDGNKLOZXUCY5MZDDSKWDZKP02XRZFE&v=20130815", restaurauntId];
    NSString* responseString = [self getDataFrom:menuQueryString];
    
    if( responseString )
    {
        NSData* responseStringAsData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSError* e;
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:responseStringAsData options:kNilOptions error:&e];
        
        if( e )
        {
            NSLog(@"Foursquare DB Error: %@", e);
        }
        else
        {
            //NSLog(@"%@", jsonData );
            //NSLog(@"Menu Count: %@", jsonData[@"response"][@"menu"][@"count"] );
            //NSLog(@"Menus Count: %@", jsonData[@"response"][@"menu"][@"menus"][@"count"]);
            //NSArray* items = jsonData[@"response"][@"menu"][@"menus"][@"items"];
            //NSLog(@"Items 0: %@", items[0]);
            //NSLog(@"Items 1: %@", items[1]);
            return jsonData[@"response"][@"menu"][@"menus"];
        }
    }
    return nil;
}


@end
