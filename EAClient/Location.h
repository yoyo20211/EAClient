//
//  Location.h
//  EAClient
//
//  Created by Patsapol Prommat on 11/18/2557 BE.
//  Copyright (c) 2557 YahKub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface Location : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *LnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *carLabel;


@property (weak, nonatomic) IBOutlet UITextField *Fname;
@property (weak, nonatomic) IBOutlet UITextField *Lname;
@property (weak, nonatomic) IBOutlet UITextField *Lphone;
@property (weak, nonatomic) IBOutlet UITextField *Lcar;

@property(nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)getCurrentLocation:(id)sender;
@end
