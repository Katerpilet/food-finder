//
//  RestaurauntSelectionViewController.m
//  FoodFinderApp
//
//  Created by Student on 1/31/14.
//  Copyright (c) 2014 bjd. All rights reserved.
//

#import "RestaurauntSelectionViewController.h"
@interface RestaurauntSelectionViewController ()
@end

@implementation RestaurauntSelectionViewController
{
    NSArray* _sampleRestaurauntArray;
    NSMutableDictionary* _restaurauntNameToId;
    AppManager* _appManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

-(id)init
{
    self = [super init];
    

    return self;
}

- (NSString*) getPrice : (int) price
{
    NSMutableString* priceReturnString = [[NSMutableString alloc] init];
    for( int i = 0; i < price; ++i )
    {
        [priceReturnString appendString:@"$"];
    }
    return (NSString*)priceReturnString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if( ! _restaurauntNameToId )
    {
        _restaurauntNameToId = [[NSMutableDictionary alloc] init];
    }
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    _appManager = [appdelegate appManager];
    _sampleRestaurauntArray = [_appManager getRestaurauntList];
    
    for( int i = 0; i < [_sampleRestaurauntArray count]; ++i)
    {
        Restauraunt* currentRestauraut = _sampleRestaurauntArray[ i ];
        _restaurauntNameToId[ currentRestauraut.name ] = currentRestauraut;
    }
    
    Restauraunt* firstRestauraunt = _sampleRestaurauntArray[ 0 ];
    // Use first piece of data to populate the table
    restaurauntName.text = firstRestauraunt.name;
    restaurauntLocation.text = firstRestauraunt.address;
    restaurauntPrice.text = [self getPrice : firstRestauraunt.priceRating ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Send back the number of cells to create
    return [_sampleRestaurauntArray count] - 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"RestaurauntCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Restauraunt *restauraunt = _sampleRestaurauntArray[ indexPath.row + 1 ];
    cell.textLabel.text = restauraunt.name;
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FoodSelectionViewController *navigationController = segue.destinationViewController;
    NSString* selectedRestauraunt;
    if( [sender isKindOfClass:[UITableViewCell class] ])
    {
        UITableViewCell* senderAsCell = sender;
        selectedRestauraunt = senderAsCell.textLabel.text;
    }
    else
    {
        Restauraunt* currentRestauraunt = _sampleRestaurauntArray[ 0 ];
        selectedRestauraunt = currentRestauraunt.name;
    }
    navigationController.currentRestauraunt = _restaurauntNameToId[ selectedRestauraunt ];
}
@end
