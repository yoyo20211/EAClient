//
//  LoginViewController.m
//  EAClient
//
//  Created by Pussvee Pisutpongpan on 9/20/14.
//  Copyright (c) 2014 YahKub. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoginApp:(id)sender {
    if([_UserName.text isEqualToString:@"test"] && [_PassWord.text isEqualToString:@"test"])
    {
        [self performSegueWithIdentifier:@"login" sender:self];
        self.UserName.text = @"";
        self.PassWord.text = @"";
        //NSLog(@"yes");
        
    }else if([_UserName.text isEqualToString:@""] || [_PassWord.text isEqualToString:@""]){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Please input your Username or Password!" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        
    }

    
    else{
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Username or Password incorrect Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        
    }

}

- (IBAction)LogIn:(id)sender {
    
    
}

- (IBAction)unwindToCancel:(UIStoryboardSegue *)segue{
    
}

- (IBAction)unwindToSave:(UIStoryboardSegue *)segue{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
