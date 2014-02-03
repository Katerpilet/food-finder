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
    NSMutableArray* _previousList;
    Menu* _menu;
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
    
    _menu = [_appManager getMenuWithRestaurantId:_currentRestauraunt.idFSRestaurant];
    _baseMenuList = _menu.menuItems[ 0 ];
    _menuList = _baseMenuList;  // need to actually query for this...
    
    
    NSData *urlData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:_currentRestauraunt.photoURL]];
    UIImage *urlImage = [[UIImage alloc] initWithData:urlData];
    [restarauntView setImage:urlImage];
    
       
    if( !_previousList )
    {
        _previousList = [[NSMutableArray alloc] init];
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
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
    }
    else
    {
        menuItem = _menuList.children[ indexPath.row ];
    }
    cell.textLabel.text = menuItem.name;
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    [_previousList addObject:_menuList];
    _menuList = _menuList.children[ indexPath.row ];
    if( _menuList.children == nil )
    {
        [self performSegueWithIdentifier:@"selectionSegue" sender:tableView];
        
    }
    else
    {
        [tableView reloadData];
    }
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FoodMenuViewController *navigationController = segue.destinationViewController;
    
    navigationController.selectedFood = _menuList;
    navigationController.parentMenu = _menu;
}

-(IBAction)selectPreviousMenuItem:(UIButton*)sender
{
    _menuList = _previousList[ [_previousList count] ];
    [_previousList removeObjectAtIndex:[_previousList count ]];
    [mainTableView reloadData];
}
@end
