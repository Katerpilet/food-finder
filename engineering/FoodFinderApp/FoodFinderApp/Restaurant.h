//
//  Restauraunt.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject
@property(nonatomic,readonly) NSString* name;
@property(nonatomic,readonly) NSString* description;
@property(nonatomic,readonly) NSString* address;
@property(nonatomic,readonly) NSString* idFSRestauraunt;
@property(nonatomic,readonly) int globalRating;
@property(nonatomic,readonly) int priceRating;

-(Restaurant*) initWithName:(NSString*)name description : (NSString*)description address : (NSString*)address idFSRestaraunt : (NSString*) idFSRestauraunt globalRating : (int) globalRating priceRating : (int) priceRating;
-(Restaurant*) initWithJSON: (NSDictionary*) jsonDictionary;

@end
