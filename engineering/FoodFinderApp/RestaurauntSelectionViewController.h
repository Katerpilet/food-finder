//
//  RestaurauntSelectionViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FoodSelectionViewController.h"

static const int OFFSET_FOR_KEYBOARD = 250.0f;
@interface RestaurauntSelectionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    UILabel IBOutlet  *restaurauntName;
    UILabel IBOutlet  *restaurauntPrice;
    UILabel IBOutlet  *restaurauntLocation;
    UITableView IBOutlet *restaurantTableView;
    UIImageView IBOutlet *restaurantImage;
}
@property id delegate;
-(void)initializeRestaurantList : (NSArray*) restaurantList;
-(void)setMovedViewUp:(BOOL)moveUp;
@end
