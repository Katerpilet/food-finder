//
//  FoodMenuViewController.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@interface FoodMenuViewController : UIViewController
{
    UILabel IBOutlet *_foodName;
    UILabel IBOutlet *_foodPrice;
}

@property MenuItem *selectedFood;
@end
