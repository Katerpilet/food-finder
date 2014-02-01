//
//  MasterViewController.h
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat OFFSET_FOR_KEYBOARD = 150.0f;
@interface MasterViewController : UIViewController<UITextFieldDelegate>
-(void)setMovedViewUp:(BOOL)moveUp; 
@end
