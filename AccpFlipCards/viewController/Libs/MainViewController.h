//
//  MainViewController.h
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "Constants.h"
@interface MainViewController : UIViewController
{

    __weak IBOutlet UIView *contentView;
    __weak IBOutlet UIView *menuView;
    __weak IBOutlet UIImageView *headerView;
    MenuViewController *menuScreen;
    
    UIViewController *contentScreen;
    
    BOOL isMenuOn;
    
    __weak IBOutlet UIButton *btnMenu;
    NSInteger yPos;

}
-(void)addContentViewWithViewController:(UIViewController *)viewController;
@property(strong, nonatomic) NSString *contentViewStoryboardId;
@property(strong, nonatomic) NSString *menuViewStoryboardId;

@end
