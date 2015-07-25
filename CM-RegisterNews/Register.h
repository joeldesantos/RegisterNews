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

@end
