//
//  loadingViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/15/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "loadingViewController.h"
#import "feedViewCOntroller.h"

@interface loadingViewController ()

@end

@implementation loadingViewController

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
        
    // have this shit load
    [self performSelector:@selector(nextPage) withObject:nil afterDelay:2];
    
}

- (void)nextPage{
    // code to push to next page
    feedViewController *vc = [[feedViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
