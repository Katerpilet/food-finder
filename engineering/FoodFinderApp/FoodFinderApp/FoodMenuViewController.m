//
//  FoodMenuViewController.m
//  FoodFinderApp
//
//  Created by Student on 2/2/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "FoodMenuViewController.h"

@interface FoodMenuViewController ()

@end

@implementation FoodMenuViewController
{
    UIImage *_unselectedStar;
    UIImage *_selectedStar;
    int _currentRating;
    AppManager *_appManager;
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
	_foodName.text = _selectedFood.name;
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    _appManager = [appdelegate appManager];
    
    if( _selectedFood.price > 0 )
    {
        _foodPrice.text = [NSString stringWithFormat:@"$%i", _selectedFood.price];
    }
    else
    {
        _foodPrice.text = @"";
    }
    
    if( !_unselectedStar )
    {
        _unselectedStar = [UIImage imageNamed:@"EmptyStarIcon.png"];
    }
    if( !_selectedStar )
    {
        _selectedStar = [UIImage imageNamed:@"FilledStarIcon.png"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonTapped:(UIButton*)button
{
    if( button == _button4 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_selectedStar forState:UIControlStateNormal];
        [_button4 setImage:_selectedStar forState:UIControlStateNormal];
        _currentRating = 5;
    }
    else if( button == _button3 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_selectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
        _currentRating = 4;
    }
    else if( button == _button2 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
        _currentRating = 3;
    }
    else if( button == _button1 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
        _currentRating = 2;
    }
    else if( button == _button0 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button2 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
        _currentRating = 1;
    }
    
}

-(IBAction)submitFood:(UIButton*)button
{
    
}

@end
