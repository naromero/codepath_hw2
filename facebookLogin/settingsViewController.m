//
//  settingsViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/15/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "settingsViewController.h"
#import "loginViewController.h"

@interface settingsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
- (IBAction)onLogout:(id)sender;

@end

@implementation settingsViewController

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
    self.navigationItem.title = @"More";
    
    // Left Navigation Button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"navButtonLeft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Right Navigation Button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navButtonRight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //configure scrollView
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(320, 1549)];
    
    
    // Scrollable Feed Image
    UIImage *feedImage = [UIImage imageNamed:@"settings"];
    CGRect thumbnailFrame = CGRectMake(0,0,320,1549);
    UIImageView *thumbnailImageView = [[UIImageView alloc] initWithFrame:thumbnailFrame];
    thumbnailImageView.image = feedImage;
    
    [self.scrollView addSubview:thumbnailImageView];
    
    // Move button to front
    [self.scrollView bringSubviewToFront:self.logoutButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogout:(id)sender {
    
    
    loginViewController *vc = [[loginViewController alloc] init];
    
    vc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
