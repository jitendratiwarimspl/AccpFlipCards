//
//  HomeViewController.h
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "AccpAppDelegate.h"
@interface HomeViewController : UIViewController
{

    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UIButton *btnContent;
    __weak IBOutlet UIButton *btnShuffle;
    __weak IBOutlet UIButton *btnResume;
    __weak IBOutlet UIButton *btnNotes;
}

@end
