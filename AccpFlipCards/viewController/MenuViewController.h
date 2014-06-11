//
//  MenuViewController.h
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
typedef void(^MenuTransitionCompletinBlock)(void);
@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UIView *BackFadingView;
    __weak IBOutlet UIView *menuContentView;
    __weak IBOutlet UITableView *tblMenuOption;
    NSMutableArray *arrayMenuOption;
    NSInteger tblYPos;
}
-(void)MenuScreenOutWithCompletionBlock:(MenuTransitionCompletinBlock)block;
-(void)MenuScreenInWithCompletionBlock:(MenuTransitionCompletinBlock)block;
@end
