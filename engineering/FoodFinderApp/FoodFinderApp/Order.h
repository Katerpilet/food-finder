//
//  Order.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject
@property (nonatomic, strong) NSString* dateOrdered;
@property (nonatomic) int idOrder;
@property (nonatomic) int rating;
@end
