//
//  MasterViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

static const CGFloat OFFSET_FOR_KEYBOARD = 200.0f;
@interface MasterViewController : UIViewController<UITextFieldDelegate>
{
    UIButton IBOutlet *loginButton;
    UITextField IBOutlet *loginField;
    UITextField IBOutlet *passwordField;
}
-(void)setMovedViewUp:(BOOL)moveUp; 
@end
