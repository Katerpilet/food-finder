//
//  RegistrationViewController.m
//  FoodFinderApp
//
//  Created by Student on 2/1/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController
{
    AppManager* _appManager;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    _appManager = [appdelegate appManager];
    
	[registerButton addTarget:self action:@selector(registerAccount:) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardWillShow
{
    if( self.view.frame.origin.y >= 0 )
    {
        [self setMovedViewUp:YES];
    }
    else if( self.view.frame.origin.y < 0 )
    {
        [self setMovedViewUp:NO];
    }
}

-(void)keyboardWillHide
{
    if( self.view.frame.origin.y >= 0 )
    {
        [self setMovedViewUp:YES];
    }
    else if( self.view.frame.origin.y < 0 )
    {
        [self setMovedViewUp:NO];
    }
}

-(void)setMovedViewUp:(BOOL)moveUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    
    CGRect rect = self.view.frame;
    if( moveUp )
    {
        rect.origin.y -= OFFSET_FOR_KEYBOARD;
        rect.size.height += OFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += OFFSET_FOR_KEYBOARD;
        rect.size.height -= OFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

-(void)registerAccount : (id)sender
{
    NSString* nameString = nameField.text;
    NSString* passwordString = passwordField.text;
    
    BOOL registerSuceeded = [_appManager registerWithUsername:nameString andPassword:passwordString];
    if( registerSuceeded )
    {
        [self performSegueWithIdentifier:@"segue1" sender:sender];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registration Failed" message:@"Username may already be taken" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
