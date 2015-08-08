//
//  Register.h
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

//Debug
#define nDebugEnable        1
#define print(x)            if(nDebugEnable){(x);}

//Texts
#define nMaxTxtData         50

@interface Register : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtFirstSurname;
@property (strong, nonatomic) IBOutlet UITextField *txtSecondSurname;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtPasswordConfirm;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup1;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup2;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup3;
@property (strong, nonatomic) IBOutlet UIView *vDataGroup4;
@property (strong, nonatomic) IBOutlet UIScrollView *svRegister;
@property (strong, nonatomic) IBOutlet UITextField *txtDate;


- (IBAction)btnNextPressed:(id)sender;

- (IBAction)btnMenuPressed:(id)sender;
- (IBAction)btnGooglePressed:(id)sender;
- (IBAction)btnFacebookPressed:(id)sender;
/*
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
 FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
 [login logInWithReadPermissions:@[@"email", @"public_profile"]
 handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
 if (error) {
 // Process error
 } else if (result.isCancelled) {
 // Handle cancellations
 } else {
 // If you ask for multiple permissions at once, you
 // should check if specific permissions missing
 if ([result.grantedPermissions containsObject:@"email"]) {
 // Do work
 NSLog(@"result: %@",result);
 NSLog(@"profileUpdated");
 NSLog(@"Url: %@",[FBSDKProfile currentProfile].linkURL);
 NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
 NSLog(@"Name: %@",[FBSDKProfile currentProfile].firstName);
 NSLog(@"Last name: %@",[FBSDKProfile currentProfile].lastName);
 NSLog(@"Middle name: %@",[FBSDKProfile currentProfile].middleName);
 self.diFacebookResult = result;
 NSLog(@"fetched user:%@  and Email : %@", self.diFacebookResult,self.diFacebookResult[@"email"]);
 NSLog(@"diFacebookResult: %@", self.diFacebookResult);
 
 }
 }
 }];
 [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileUpdated:) name:FBSDKProfileDidChangeNotification object:nil];
 */

/*
 //-------------------------------------------------------------------------------
 -(void)profileUpdated:(NSNotification *) notification{
 NSLog(@"profileUpdated");
 NSLog(@"Url: %@",[FBSDKProfile currentProfile].linkURL);
 NSLog(@"User ID: %@",[FBSDKProfile currentProfile].userID);
 NSLog(@"Name: %@",[FBSDKProfile currentProfile].firstName);
 NSLog(@"Last name: %@",[FBSDKProfile currentProfile].lastName);
 NSLog(@"Middle name: %@",[FBSDKProfile currentProfile].middleName);
 NSLog(@"fetched user:%@  and Email : %@", self.diFacebookResult,self.diFacebookResult[@"email"]);
 NSLog(@"diFacebookResult: %@", self.diFacebookResult);
 }
 */
@end
