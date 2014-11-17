//
//  RegisterUserViewController.m
//  EAClient
//
//  Created by Pussvee Pisutpongpan on 9/20/14.
//  Copyright (c) 2014 YahKub. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterUserViewController.h"

@interface RegisterUserViewController ()
@property (weak,nonatomic) IBOutlet UITextField *firstName;
@property (weak,nonatomic) IBOutlet UITextField *lastName;
@property (weak,nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak,nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) NSMutableData *mutData;
@end


@implementation RegisterUserViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if (sender != self.doneButton) return ;
//    if (self.textField.text.length > 0) {
//        self.toDoItem = [[YahToDoItem alloc] init];
//        self.toDoItem.itemName = self.textField.text;
//        self.toDoItem.completed = NO;
//    }
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
- (IBAction)registerUser:(id)sender {
    NSString *urlString = @"http://app.expressautoapp.com/CommonAPI/RegisterAppUser";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:3.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:_email.text forHTTPHeaderField:@"email"];
    [request setValue:_phoneNumber.text forHTTPHeaderField:@"phoneNumber"];
    [request setValue:_firstName.text forHTTPHeaderField:@"firstName"];
    [request setValue:_lastName.text forHTTPHeaderField:@"lastName"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    if (connection) {
        _mutData = [NSMutableData data];
    }
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[_mutData length]);
    NSString *str = [[NSString alloc] initWithData:_mutData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@\n", error.description);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_mutData setLength:0];
    NSLog(@"%@\n", response.description);
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mutData appendData:data];
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
