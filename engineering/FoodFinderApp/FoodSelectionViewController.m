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
    MenuItemNode *_baseMenuList;
    MenuItemNode *_menuList;
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
    
    _baseMenuList = [_appManager getMenuWithRestaurantId:_currentRestauraunt.idFSRestauraunt].menuItems[ 0 ];
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
    if( _menuList.children == nil)    // if it is not a NSArray we assume everything past 0 is coo
    {
        _isFinalDepth = YES;
    }
    
    // Send back the number of cells to create
    return [_menuList.children count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellIdentifier = @"FoodCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    MenuItemNode *menuItem;
    if( _isFinalDepth )
    {
        menuItem = _menuList.children[ indexPath.row ];
        [self sendAchievementUnlocked];
    }
    else
    {
        menuItem = _menuList.children[ indexPath.row ];
    }
    cell.textLabel.text = menuItem.name;
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
    
    _menuList = _menuList.children[ indexPath.row ];
    if( _menuList.children == nil )
    {
        [self performSegueWithIdentifier:@"selectionSegue" sender:tableView];
    }
    [tableView reloadData];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    skView.hidden = YES;
}

@end
