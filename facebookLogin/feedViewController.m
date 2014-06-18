//
//  feedViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/15/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "feedViewController.h"
#import "profileViewController.h"
#import "composeVIewController.h"

@interface feedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
- (IBAction)onUserProfile:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;

@property (weak, nonatomic) IBOutlet UIButton *composeButton;
- (IBAction)onCompose:(id)sender;



@end

@implementation feedViewController

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
    // Do any additional setup after loading the view from its nib.
    
    // Navigation Settings
    self.navigationItem.title = @"News Feed";
    
    // Left Navigation Button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"navButtonLeft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Right Navigation Button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navButtonRight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;

    
    // Feed Actions
    UIImage *feedActionsImage = [UIImage imageNamed:@"status_bar"];
    CGRect actionsFrame = CGRectMake(0, 64, 320, 45);
    UIImageView *feedActions = [[UIImageView alloc] initWithFrame:actionsFrame];
    feedActions.image = feedActionsImage;
    
    [self.view addSubview:feedActions];
    
    // Delay drawing of newsfeed
    [self performSelector:@selector(drawNewsFeed) withObject:nil afterDelay:2];
    
    // Kill button background color (Not sure why the option isn't available in interface builder anymore?)
    self.profileButton.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.composeButton.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    // Configure back button on profile view
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
    
}

- (void)drawNewsFeed {
    //configure scrollView
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 1455)];
    
    
    // Scrollable Feed Image
    UIImage *feedImage = [UIImage imageNamed:@"feed-long"];
    CGRect thumbnailFrame = CGRectMake(0,46,320,1455);
    UIImageView *thumbnailImageView = [[UIImageView alloc] initWithFrame:thumbnailFrame];
    thumbnailImageView.image = feedImage;
    
    [self.scrollView addSubview:thumbnailImageView];
    
    //Move buttons created in interface builder above imageViews
    [self.view bringSubviewToFront:self.composeButton];
    [self.scrollView bringSubviewToFront:self.profileButton];
    
    NSLog(@"This shit happened");
    
    // Stop loading animation
    [self.indicatorView stopAnimating];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUserProfile:(id)sender {
    
    profileViewController *vc = [[profileViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (IBAction)onCompose:(id)sender {
    composeViewController *vc = [[composeViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


@end
