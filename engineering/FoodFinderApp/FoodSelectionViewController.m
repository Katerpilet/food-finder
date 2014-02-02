//
//  FoodSelectionViewController.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "FoodSelectionViewController.h"

@interface FoodSelectionViewController ()

@end

@implementation FoodSelectionViewController
{
    AppManager *_appManager;
    NSArray *_baseMenuList;
    NSArray *_menuList;
    int _depthCounter;
    bool _isFinalDepth;
    bool _isBaseDepth;
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
    _depthCounter = 0;
    _isFinalDepth = NO;
    _isBaseDepth = YES;
    restaurauntName.text = _currentRestauraunt.name;
    restaurauntAddress.text = _currentRestauraunt.address;
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    _appManager = [appdelegate appManager];
    
    _baseMenuList = [_appManager getMenuWithRestaurantId:_currentRestauraunt.idFSRestauraunt];
    _menuList = _baseMenuList;  // need to actually query for this...
    skView.alpha = 0.5f;
    skView.hidden = YES;
    
    SKScene *scene = [SKScene sceneWithSize:skView.bounds.size];
    scene.backgroundColor = [SKColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
    [skView presentScene:scene];
    
    NSString* myParticlePath = [[NSBundle mainBundle] pathForResource:@"AchievementParticle" ofType:@"sks"];
    SKEmitterNode* achievementParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    achievementParticle.position = CGPointMake(0, 100);
    
    [scene addChild:achievementParticle ];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if( ![_menuList[1][ 0 ] isKindOfClass:[NSArray class]]  && !_isBaseDepth )    // if it is not a NSArray we assume everything past 0 is coo
    {
        _isFinalDepth = YES;
    }
    
    if( _isBaseDepth )
    {
        return [_menuList count];
    }
    // Send back the number of cells to create
    return [_menuList[ 1 ] count] - 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellIdentifier = @"FoodCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    NSString *menuItem;
    if( _isFinalDepth )
    {
        menuItem = _menuList[ 1 ][ indexPath.row ];
        [self sendAchievementUnlocked];
    }
    else
    {
        menuItem = _menuList[ indexPath.row ][ 0 ];
    }
    cell.textLabel.text = menuItem;
    return cell;
}

-(void)sendAchievementUnlocked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement Unlocked!" message:@"You unlocked the Dear Diary... Achievement" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    skView.hidden = NO;
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    if( _isFinalDepth )
    {
        [self performSegueWithIdentifier:@"selectionSegue" sender:tableView];
    }
    else
    {
        _menuList = _menuList[ indexPath.row ];
        _isBaseDepth = NO;
        [tableView reloadData];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    skView.hidden = YES;
}

@end
