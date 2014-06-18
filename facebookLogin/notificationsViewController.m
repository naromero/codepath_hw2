//
//  notificationsViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/15/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "notificationsViewController.h"

@interface notificationsViewController ()

@end

@implementation notificationsViewController

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
    self.navigationItem.title = @"Notifications";
    
    // Left Navigation Button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"navButtonLeft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Right Navigation Button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navButtonRight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
