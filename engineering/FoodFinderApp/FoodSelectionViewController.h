//
//  FoodSelectionViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "FoodFinderApp/Restauraunt.h"
#include "AppDelegate.h"

@interface FoodSelectionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UILabel IBOutlet *restaurauntName;
    UILabel IBOutlet *restaurauntAddress;

}
@property (nonatomic, strong) Restauraunt *currentRestauraunt;


@end
