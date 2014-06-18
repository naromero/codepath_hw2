//
//  composeViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/17/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "composeViewController.h"

@interface composeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *composeInput;

@end

@implementation composeViewController

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
    
    [self.composeInput becomeFirstResponder];
    
    // Create "Cancel" button
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(onCancelButton:)];
    UIBarButtonItem *postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleDone target:self action:nil];
    
    // Navigation Bar Styling
    self.navigationItem.title = @"Update Status";
    
    // Navigation bar styling
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    self.navigationItem.rightBarButtonItem = postButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
