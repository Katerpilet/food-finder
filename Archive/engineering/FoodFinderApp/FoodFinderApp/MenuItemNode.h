//
//  MenuItemNode.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItemNode : NSObject
@property (nonatomic, strong) NSMutableArray* children;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* idFSItem;

-(MenuItemNode*)initWithChildrenJson : (NSArray*) childrenJson name : (NSString*) name description : (NSString*) description itemId : (NSString*) idFSItem;
@end
