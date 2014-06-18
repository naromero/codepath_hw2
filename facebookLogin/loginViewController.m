//
//  loginViewController.m
//  facebookLogin
//
//  Created by Nathan Romero on 6/14/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "loginViewController.h"
#import "feedViewController.h"
#import "settingsViewController.h"
#import "requestsViewController.h"
#import "messagesViewController.h"
#import "notificationsViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
- (IBAction)onLogin:(id)sender;

- (IBAction)onPwChange:(id)sender;
- (IBAction)onUserChange:(id)sender;

//Keyboard related methods

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (IBAction)onTap:(id)sender;


@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginView.frame = CGRectMake(0, 50, self.loginView.frame.size.width, self.loginView.frame.size.height);
                     }
                     completion:nil];

}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
        
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginView.frame = CGRectMake(0, 120, self.loginView.frame.size.width, self.loginView.frame.size.height);
                     }
                     completion:nil];

}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void) validatePW {
    
    NSString *passwordText = self.password.text;
    
    if ([passwordText isEqualToString:@"password"]) {
       
        // take user to profile
        NSLog(@"Correct password!!");
        
        
        // Create tabBarController
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        
        // View to be contained within tab bar controller
        feedViewController *firstViewController = [[feedViewController alloc] init];
        UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        
        
        requestsViewController *secondViewController = [[requestsViewController alloc] init];
        UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
        
        
        
        messagesViewController *thirdViewController = [[messagesViewController alloc] init];
        UINavigationController *thirdNavigationController = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
        
        
        notificationsViewController *fourthViewController = [[notificationsViewController alloc] init];
        UINavigationController *fourthNavigationController = [[UINavigationController alloc] initWithRootViewController:fourthViewController];
        
        
        
        settingsViewController *fifthViewController = [[settingsViewController alloc] init];
        UINavigationController *fifthNavigationController = [[UINavigationController alloc] initWithRootViewController:fifthViewController];
        
        
        
        
        // Assignment of views to tab bar controller via an array
        tabBarController.viewControllers = @[firstNavigationController, secondNavigationController, thirdNavigationController, fourthNavigationController, fifthNavigationController];
        
        
        // Assigning properties to views
        firstNavigationController.tabBarItem.title = @"Feed";
        firstNavigationController.tabBarItem.image = [UIImage imageNamed:@"feedIcon"];
        
        secondNavigationController.tabBarItem.title = @"Requests";
        secondNavigationController.tabBarItem.image = [UIImage imageNamed:@"requestsIcon"];
        
        thirdNavigationController.tabBarItem.title = @"Messenger";
        thirdNavigationController.tabBarItem.image = [UIImage imageNamed:@"messengerIcon"];
        
        fourthNavigationController.tabBarItem.title = @"Notifications";
        fourthNavigationController.tabBarItem.image = [UIImage imageNamed:@"notificationsIcon"];
        
        fifthNavigationController.tabBarItem.title = @"More";
        fifthNavigationController.tabBarItem.image = [UIImage imageNamed:@"settingsIcon"];
        
        tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:tabBarController animated:YES completion:nil];
        

        
        
    } else {
        // code to flag error
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
    // Stop loading animation
    [self.indicatorView stopAnimating];
    
    // Remove loading button
    self.loginButton.selected = NO;

}


- (IBAction)onLogin:(id)sender {
    
    // Start loading animation
    [self.indicatorView startAnimating];
    
    // Change to loading button
    self.loginButton.selected = YES;
    
    // Run password validation function with delay
    [self performSelector:@selector(validatePW) withObject:nil afterDelay:2];
    
}

- (IBAction)onPwChange:(id)sender {
    
    //Check to see if log in button should be enabled
    if (self.userName.text.length > 0 && self.password.text.length > 0) {
        self.loginButton.enabled = YES;
    } else {
        self.loginButton.enabled = NO;
    }
}

- (IBAction)onUserChange:(id)sender {
    //Check to see if log in button should be enabled
    if (self.userName.text.length > 0 && self.password.text.length > 0) {
        self.loginButton.enabled = YES;
    } else {
        self.loginButton.enabled = NO;
    }

}






























@end
