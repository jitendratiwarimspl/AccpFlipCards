//
//  AccpAppDelegate.h
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
@interface AccpAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow* topWindow;
    BOOL isLessThenFourInchesDevice;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic)BOOL isLessThenFourInchesDevice;
@end
