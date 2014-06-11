//
//  HomeViewController.m
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view.
    if(kAppDelegate.isLessThenFourInchesDevice){
        
           [self frameChangeForThreeAndHalfInchesDevice];
    }

}
-(void)frameChangeForThreeAndHalfInchesDevice{
    CGFloat yPos = 40;
    CGRect rect = imgView.frame;
    rect.size.height = imgView.frame.size.height-68-20;
    imgView.frame= rect;
    rect = btnContent.frame;
    rect.origin.y = btnContent.frame.origin.y - yPos;
    btnContent.frame = rect;
    rect = btnShuffle.frame;
    rect.origin.y = btnShuffle.frame.origin.y - yPos;
    btnShuffle.frame = rect;
    rect = btnResume.frame;
    rect.origin.y = btnResume.frame.origin.y - yPos;
    btnResume.frame = rect;
    rect = btnNotes.frame;
    rect.origin.y = btnNotes.frame.origin.y - yPos;
    btnNotes.frame = rect;
}
-(IBAction)btnContents_Click:(id)sender{
    [self performSegueWithIdentifier:@"STATS" sender:nil];
    NSLog(@"jitendra tiwari");
}
-(IBAction)btnShuffle_Click:(id)sender{
}
-(IBAction)btnResume_Click:(id)sender{
}
-(IBAction)btnNotes_Click:(id)sender{
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"STATS"])
    {
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
