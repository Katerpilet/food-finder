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

@interface RestaurauntSelectionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UILabel IBOutlet  *restaurauntName;
    UILabel IBOutlet  *restaurauntPrice;
    UILabel IBOutlet  *restaurauntLocation;
}
@property id delegate;
@end
