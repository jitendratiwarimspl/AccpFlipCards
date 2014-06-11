//
//  ACCPCustomSegue.m
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import "ACCPCustomSegue.h"
#import "MainViewController.h"
@implementation ACCPCustomSegue
-(void)perform
{
    UIViewController *destinationViewController = [self destinationViewController];
    MainViewController *bmiViewController = (MainViewController *)[[self sourceViewController] parentViewController];
    [bmiViewController addContentViewWithViewController:destinationViewController];
}
@end
