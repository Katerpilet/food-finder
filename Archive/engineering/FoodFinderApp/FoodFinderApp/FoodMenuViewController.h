//
//  FoodMenuViewController.h
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "MenuItem.h"
#import "AppDelegate.h"
#import "UserMenuItem.h"

static const float FOOD_MENU_OFFSET_FOR_KEYBOARD = 200.0f;
static const NSString* DEFAULT_TEXT = @"Enter notes here";
@interface FoodMenuViewController : UIViewController<UITextViewDelegate>
{
    UILabel IBOutlet *_foodName;
    UILabel IBOutlet *_foodPrice;
    
    UIButton IBOutlet *_button0;
    UIButton IBOutlet *_button1;
    UIButton IBOutlet *_button2;
    UIButton IBOutlet *_button3;
    UIButton IBOutlet *_button4;
    
    UIImageView IBOutlet *_foodImage;
    UIImageView IBOutlet *_photoView;
    
    UITextView IBOutlet *_commentBox;
    
    SKView  IBOutlet *skView;
}

@property MenuItem *selectedFood;
@property Menu *parentMenu;

-(IBAction)buttonTapped:(UIButton*)button;
-(IBAction)submitFood:(UIButton*)button;
-(IBAction)saveNotes:(UIButton*)sender;
-(IBAction)takePicture:(UIButton*)sender;

-(void)setMovedViewUp:(BOOL)moveUp;

-(void) setUserRating;

-(void)sendAchievementUnlocked;
@end
