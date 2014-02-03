//
//  FoodMenuViewController.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "AppDelegate.h"

@interface FoodMenuViewController : UIViewController
{
    UILabel IBOutlet *_foodName;
    UILabel IBOutlet *_foodPrice;
    
    UIButton IBOutlet *_button0;
    UIButton IBOutlet *_button1;
    UIButton IBOutlet *_button2;
    UIButton IBOutlet *_button3;
    UIButton IBOutlet *_button4;
}

@property MenuItem *selectedFood;

-(IBAction)buttonTapped:(UIButton*)button;
-(IBAction)submitFood:(UIButton*)button;
@end
