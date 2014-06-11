//
//  AccpViewController.m
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize contentViewStoryboardId, menuViewStoryboardId;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    headerView.frame = CGRectMake(0.0, 0.0, 320.0, 64.0);
    NSLog(@"Rama");
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        [self setNeedsStatusBarAppearanceUpdate];
        yPos = 0;
    }else{
        yPos = 20;
    }
    CGRect rect = menuView.frame;
    rect.origin.y = menuView.frame.origin.y - yPos;
    menuView.frame = rect;
    
    menuScreen = [self.storyboard instantiateViewControllerWithIdentifier:self.menuViewStoryboardId];
    [self addChildViewController:menuScreen];
    [menuView addSubview:[menuScreen view]];
    [menuScreen didMoveToParentViewController:self];
   
    contentScreen = [self.storyboard instantiateViewControllerWithIdentifier:self.contentViewStoryboardId];
    [self addContentScreen];
    
    
    isMenuOn = NO;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)addContentScreen
{
    [self addChildViewController:contentScreen];
    [contentScreen.view setFrame:CGRectMake(0.0, 44.0, contentView.frame.size.width, contentView.frame.size.height-44)];
    [contentView addSubview:[contentScreen view]];
    [contentScreen didMoveToParentViewController:self];
    contentView.frame = CGRectMake(0.0, 0.0, contentView.frame.size.width, contentView.frame.size.height);
  /*
    [menuScreen MenuScreenOutWithCompletionBlock:^{
        
        menuView.frame = CGRectMake(menuView.frame.origin.x - menuView.frame.size.width, menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height);
        
    }];
   */
}
#pragma mark action methods

- (IBAction)btnMenu_onClick:(id)sender
{
    if (isMenuOn)
    {
        //if menu screen is visible
        
        isMenuOn = NO;
        
        [menuScreen MenuScreenOutWithCompletionBlock:^{
            
            contentView.frame = CGRectMake(0.0, contentView.frame.origin.y, contentView.frame.size.width, contentView.frame.size.height);
            
        }];
    }
    else
    {
        //if menu screen is not visible
        
        isMenuOn = YES;
        
        [menuScreen MenuScreenInWithCompletionBlock:^{
            
            contentView.frame = CGRectMake(270.0, contentView.frame.origin.y, contentView.frame.size.width, contentView.frame.size.height);
            
        }];
    }
}


- (IBAction)swipeLeft:(id)sender
{
    if (isMenuOn)
    {
        isMenuOn = NO;
        
        [menuScreen MenuScreenOutWithCompletionBlock:^{
            
            menuView.frame = CGRectMake(menuView.frame.origin.x - menuView.frame.size.width, menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height);
            
        }];
    }
}
#pragma mark misc

-(void)addContentViewWithViewController:(UIViewController *)viewController
{
    UIViewController *oldTopViewController = contentScreen;
    
    [oldTopViewController.view removeFromSuperview];
    [oldTopViewController willMoveToParentViewController:nil];
    [oldTopViewController beginAppearanceTransition:NO animated:NO];
    [oldTopViewController removeFromParentViewController];
    [oldTopViewController endAppearanceTransition];
    
    contentScreen = nil;
    contentScreen = viewController;
    
    [self addContentScreen];
    
    [self btnMenu_onClick:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
