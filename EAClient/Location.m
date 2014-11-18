//
//  Location.m
//  EAClient
//
//  Created by Patsapol Prommat on 11/18/2557 BE.
//  Copyright (c) 2557 YahKub. All rights reserved.
//

#import "Location.h"
@interface Location()
@end

@implementation Location
@synthesize Fname,Lname,Lphone,Lcar;

//CLLocationManager *locationManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager startUpdatingLocation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)getCurrentLocation:(id)sender {
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //[self.locationManager startUpdatingLocation];
    
    //CLLocation *currentLocation;
    
    NSLog(@"%@", [self deviceLat]);
    //NSString *longT = [NSString stringWithFormat:@"%.8f", x.coordinate.longitude];
    
    
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        //[locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    if([[Lname text] isEqualToString:@""] || [[Fname text] isEqualToString:@""] || [[Lphone text] isEqualToString:@""]|| [[Lcar text] isEqualToString:@""]  ) {
        
        [[[UIAlertView alloc] initWithTitle:@"Please fill all information" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
        
    }else{
        
        //NSString *longT = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //NSString *lati = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        
        //รับข้อมูล
        NSString *sName = [NSString stringWithFormat:@"%@",Fname.text ];
        NSString *sUserName = [[NSString alloc]initWithFormat:@"%@",Lname.text];
        NSString *sPhone = [[NSString alloc]initWithFormat:@"%@",Lphone.text];
        NSString *sCar = [[NSString alloc]initWithFormat:@"%@",Lcar.text];
        NSString *sLat = [self deviceLat];
        NSString *sLong = [self deviceLon];
        
        //NSLog(@"%@",sName);
        self.longitudeLabel.text = sLat;
        self.latitudeLabel.text = sLong;
        self.nameLabel.text= sName;
        self.LnameLabel.text= sUserName;
        self.phoneLabel.text=sPhone;
        self.carLabel.text=sCar;
        
        // กำหนดค่าตัวแปรสำหรับการส่งแบบ HTTP POST
        
        NSString *post = [NSString stringWithFormat:@"submit=submit&name=%@&username=%@&phone=%@&car=%@&lati=%@&longt=%@",sName,sUserName,sPhone,sCar,sLat,sLong];//&lati=%@&longt=%@ ,lati,longT
        // กำหนด ตัวแปรที่ต้องการส่งไป
        NSLog(@"%@",post);
        
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        // ทำการ set Encoding
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost:8888/test/location.php"]];
        // ติดต่อ URL Request
        
        [request setHTTPMethod:@"POST"]; // Set method เป็น POST
        [request setHTTPBody:postData]; // ส่ง Data
        
        NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        if(conn)
        {
            NSLog(@"Successfully");
            [[[UIAlertView alloc] initWithTitle:@"Successfully" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            
            self.Fname.text = @"";
            self.Lname.text = @"";
            self.Lphone.text = @"";
            self.Lcar.text = @"";
            
            
        }else{
            NSLog(@"Error");
        }
        
    }
    
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
}

/*- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{}
 {
 NSLog(@"didUpdateToLocation: %@", newLocation);
 CLLocation *currentLocation = newLocation;
 
 if (currentLocation != nil) {
 
 NSString *longT = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
 NSString *lati = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
 
 self.longitudeLabel.text = longT;
 self.latitudeLabel.text = lati;
 
 }
 }*/

- (NSString *)deviceLat {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
}
- (NSString *)deviceLon {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
}






@end
