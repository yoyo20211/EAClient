//
//  LoginViewController.h
//  EAClient
//
//  Created by Pussvee Pisutpongpan on 9/20/14.
//  Copyright (c) 2014 YahKub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;

- (IBAction)LoginApp:(id)sender;

- (IBAction)LogIn:(id)sender;


- (IBAction)unwindToCancel:(UIStoryboardSegue *)segue;
- (IBAction)unwindToSave:(UIStoryboardSegue *)segue;
@end
