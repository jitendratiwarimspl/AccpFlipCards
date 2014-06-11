//
//  AccpAppDelegate.m
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import "AccpAppDelegate.h"

@implementation AccpAppDelegate
@synthesize isLessThenFourInchesDevice;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor colorWithRed:20/255.0f green:50/255.0f blue:150/255.0f alpha:1.0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    if(screenHeight <568){
        isLessThenFourInchesDevice = YES;
    }
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        topWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        [topWindow setWindowLevel:UIWindowLevelNormal];
        UIView *vwStatusRed = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 20.0)];
        [topWindow addSubview:vwStatusRed];
        vwStatusRed.backgroundColor =  [UIColor colorWithRed:13.0/255 green:16.0/255 blue:75.0/255 alpha:1.0];
        [topWindow addSubview:vwStatusRed];
        [topWindow makeKeyAndVisible];
    if ([ [ UIScreen mainScreen ] bounds ].size.height != 480)
    {
        //-------->iPhone5
        self.window.frame = CGRectMake(0.0, 20.0, 320.0, 548);
    }
    else
    {
        //-------->iPhone4
        self.window.frame = CGRectMake(0.0, 20.0, 320.0, 504);
    }
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
