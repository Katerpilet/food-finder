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
    _foodPrice.text = [NSString stringWithFormat:@"$%i", _selectedFood.price];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
