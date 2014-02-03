//
//  FoodSelectionViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#include "FoodFinderApp/Restaurant.h"
#include "AppDelegate.h"
#include "FoodMenuViewController.h"

@interface FoodSelectionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UILabel IBOutlet *restaurauntName;
    UILabel IBOutlet *restaurauntAddress;
    SKView  IBOutlet *skView;
    UIImageView IBOutlet *restarauntView;
}
@property (nonatomic, strong) Restaurant *currentRestauraunt;

@end
