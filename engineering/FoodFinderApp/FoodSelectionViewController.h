//
//  FoodSelectionViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#include "FoodFinderApp/Restauraunt.h"
#include "AppDelegate.h"

@interface FoodSelectionViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate>
{
    UILabel IBOutlet *restaurauntName;
    UILabel IBOutlet *restaurauntAddress;
    SKView  IBOutlet *skView;

}
@property (nonatomic, strong) Restauraunt *currentRestauraunt;

-(void)sendAchievementUnlocked;
@end
