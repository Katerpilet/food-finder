//
//  FoursquareConnector.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString* const CONNECTION_STRING_HEADER = @"https://api.foursquare.com/v2/venues/search?client_id=2EHUQ3D3IZTDR0IWNUERMDBBTNFQN4ZC5FHCHUFOK4C4DUQR&client_secret=O2PYVKLQ0CSPMA143QDGNKLOZXUCY5MZDDSKWDZKP02XRZFE&v=20130815";

static NSString* const FOURSQUARE_FOOD_CATEGORY = @"4d4b7105d754a06374d81259";
@interface FoursquareConnector : NSObject
-(NSArray*) getRestaurauntListWithLongitude : (double) longitude andLatitude: (double) latitude;
-(NSDictionary*) getMenuFromRestauraunt : (NSString*) restaurauntId;
@end
