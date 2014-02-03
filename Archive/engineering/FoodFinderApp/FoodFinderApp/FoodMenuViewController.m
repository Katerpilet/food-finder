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
    UIImagePickerController *imagePickerController;
    int _currentRating;
    AppManager *_appManager;
    BOOL _hasEdited;
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
    
    if( [_selectedFood isKindOfClass:[UserMenuItem class]])
    {
        UserMenuItem *userItem = (UserMenuItem*)_selectedFood;
        _hasEdited = YES;
        _commentBox.text = userItem.comments;
        _currentRating = userItem.userRating;
        [self setUserRating];
    }
    else
    {
        _hasEdited = NO;    //need to change if notes already there
    }

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
    
    _commentBox.text = DEFAULT_TEXT;

    if( !imagePickerController && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    
    SKScene* scene = [SKScene sceneWithSize:skView.bounds.size];
    [skView presentScene:scene];
    
    skView.alpha = .5f;
    NSString *particlePath = [[NSBundle mainBundle] pathForResource:@"AchievementParticle" ofType:@"sks"];
    SKEmitterNode *achievementParticle = [NSKeyedUnarchiver unarchiveObjectWithFile:particlePath];
    achievementParticle.particlePosition = CGPointMake(0, 200);

    
    [scene addChild:achievementParticle];
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
        _currentRating = 5;
    }
    else if( button == _button3 )
    {
        _currentRating = 4;
    }
    else if( button == _button2)
    {
        _currentRating = 3;
    }
    else if(button == _button1 )
    {
        _currentRating = 2;
    }
    else if( button == _button0 )
    {
        _currentRating = 1;
    }
    
    [self setUserRating];
    
}

-(void) setUserRating
{
    if( _currentRating == 5 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_selectedStar forState:UIControlStateNormal];
        [_button4 setImage:_selectedStar forState:UIControlStateNormal];
    }
    else if( _currentRating == 4 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_selectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
    }
    else if( _currentRating == 3 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_selectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
    }
    else if( _currentRating == 2 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_selectedStar forState:UIControlStateNormal];
        [_button2 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
    }
    else if( _currentRating == 1 )
    {
        [_button0 setImage:_selectedStar forState:UIControlStateNormal];
        [_button1 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button2 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button3 setImage:_unselectedStar forState:UIControlStateNormal];
        [_button4 setImage:_unselectedStar forState:UIControlStateNormal];
    }
}

-(IBAction)submitFood:(UIButton*)button
{
    
    BOOL result = [_appManager orderedMenuItem:_parentMenu.restarauntId :_selectedFood.idFSItem :_currentRating];
    
    NSString *responseString;
    if( result == YES )
    {
        responseString = @"Rating and Order Sent!";
    }
    else
    {
        responseString = @"Error sending Rating and Order. Please try again.";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Submission Response:" message:responseString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if( !_hasEdited)
    {
        textView.text = @"";
        _hasEdited = YES;
    }
    [self setMovedViewUp:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self setMovedViewUp:NO];
}

-(void)setMovedViewUp:(BOOL)moveUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    
    CGRect rect = self.view.frame;
    if( moveUp )
    {
        rect.origin.y -= FOOD_MENU_OFFSET_FOR_KEYBOARD;
        rect.size.height += FOOD_MENU_OFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += FOOD_MENU_OFFSET_FOR_KEYBOARD;
        rect.size.height -= FOOD_MENU_OFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

-(IBAction)saveNotes:(UIButton*)sender
{
    [self.view endEditing:YES];
    [_appManager setMenuItemComments:_parentMenu.restarauntId :_selectedFood.idFSItem :_commentBox.text];
    [self sendAchievementUnlocked];
}

-(IBAction)takePicture:(UIButton*)sender
{
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] )
    {
        [self presentViewController:imagePickerController animated:YES completion:nil];
        [imagePickerController takePicture];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [_photoView setImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)sendAchievementUnlocked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement Unlocked!" message:@"You unlocked the Dear Diary... Achievement" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    skView.hidden = NO;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    skView.hidden = YES;

}

@end
