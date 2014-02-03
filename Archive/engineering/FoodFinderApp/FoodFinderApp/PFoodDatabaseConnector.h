//
//  FoodDatabaseConnector.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FoodDatabaseConnector
@required
-(BOOL)validateWithUsername:(NSString*) username andPassword: (NSString*) password;
-(BOOL) registerWithUsername : (NSString*) username andPassword : (NSString*) password;
-(void)setRestaurauntRating:(int) idFSRestauraunt : (NSNumber*) rating;
-(void)setRestaurauntComments:(int) idFSRestauraunt : (NSString*) comment;
-(void)orderedMenuItem:(int) idFSMenuItem;
-(void)setMenuItemRating:(int) idFSMenuItem : (NSInteger*) rating;
-(void)setMenuItemComments:(int) idFSMenuItem : (NSString*) comments;
-(void)awardAchievement:(int) idAchievement;
@end
