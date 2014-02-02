//
//  RegistrationViewController.h
//  FoodFinderApp
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat OFFSET_FOR_KEYBOARD = 150.0f;
@interface RegistrationViewController : UIViewController<UITextFieldDelegate>
-(void)setMovedViewUp:(BOOL)moveUp;
@end
