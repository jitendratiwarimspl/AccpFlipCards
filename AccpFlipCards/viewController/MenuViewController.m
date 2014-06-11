//
//  MenuViewController.m
//  AccpFlipCards
//
//  Created by Jitendra on 12/05/14.
//  Copyright (c) 2014 Bellurbis. All rights reserved.
//

#import "MenuViewController.h"
#define kHeaderHeight 1;
#define kRowHeight 30
#define kTagTableCellLable 34
@interface MenuViewController ()

@end

@implementation MenuViewController

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
    NSArray *arrr =[NSArray arrayWithObjects:@"Favorites",@"Notes",@"Common Lab Values",@"Font Size",@"Info"
                    , nil];
    arrayMenuOption = [[NSMutableArray alloc] init];
    [arrayMenuOption addObjectsFromArray:arrr];
    tblMenuOption.scrollEnabled = NO;
    if(!SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        tblYPos = 0;
        CGRect rect = tblMenuOption.frame;
        rect.origin.y = tblMenuOption.frame.origin.y - 20;
    }
    [self.view setBackgroundColor:[UIColor clearColor]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark
#pragma mark Menu Transition

-(void)MenuScreenInWithCompletionBlock:(MenuTransitionCompletinBlock)block
{
    block();
    
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{

                         menuContentView.frame = CGRectMake(0.0, 0.0, menuContentView.frame.size.width, menuContentView.frame.size.height);
                         
                     }
                     completion:nil];
}

-(void)MenuScreenOutWithCompletionBlock:(MenuTransitionCompletinBlock)block
{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
//                         BackFadingView.alpha = 0.0;
                         
                           menuContentView.frame = CGRectMake(menuContentView.frame.origin.x - menuContentView.frame.size.width , 0.0, menuContentView.frame.size.width, menuContentView.frame.size.height);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         if (finished)
                         {
                             block();
                         }
                     }];
}
#pragma mark
#pragma mark tableview delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [arrayMenuOption count];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeaderHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kHeaderHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kRowHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_dropdown_200x30.png"]];
}


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectio
//{
//    static NSString *identifier = @"tblHeader";
//    
//    UILabel *headerLabel = (UILabel *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
//
//    return headerLabel;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"tblCell";
    
    UITableViewCell *cell =  [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        cell.backgroundColor = BMI_LIGHT_GRAY;
    }
    
    UILabel *lbl = (UILabel *)[cell viewWithTag:kTagTableCellLable];
    
    if(!lbl)
    {
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(20.0, 0.0, 220.0, kRowHeight)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor blackColor];
        lbl.font = [UIFont boldSystemFontOfSize:12];
        [cell addSubview:lbl];
    }
    lbl.text = [arrayMenuOption objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
               [self performSegueWithIdentifier:@"FAVORITE" sender:nil];
//        }
//        else
//        {
//            [self performSegueWithIdentifier:@"BMICalculator" sender:nil];
//        }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark
#pragma mark SEGUE

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"FAVORITE"])
    {
        //        int selectedIndex = [[tblTask indexPathForSelectedRow] row];
        
    }
    else if([segue.identifier isEqualToString:@"BMIHistory"])
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
