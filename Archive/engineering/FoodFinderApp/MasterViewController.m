//
//  MasterViewController.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "MasterViewController.h"

// Keyboard Control done with: http://stackoverflow.com/questions/1126726/how-to-make-a-uitextfield-move-up-when-keyboard-is-present
@interface MasterViewController ()

@end

@implementation MasterViewController
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
    
	[loginButton addTarget:self action:@selector(loginAccount:) forControlEvents:UIControlEventTouchDown];
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

-(IBAction)textFiledDidBegingEdition:(UITextField*)sender
{
    //[self setMovedViewUp:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(IBAction)textFieldEndEdit:(UITextField*)sender
{
    //[self setMovedViewUp:NO];
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

-(void)loginAccount : (id)sender
{
    NSString* nameString = loginField.text;
    NSString* passwordString = passwordField.text;
    
    BOOL loginSuceeded = [_appManager validateWithUsername:nameString andPassword:passwordString];
    if( loginSuceeded )
    {
        [self performSegueWithIdentifier:@"loginToRestaurauntSegue" sender:sender];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Check your username or password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


@end
