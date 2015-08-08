//
//  Register.m
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Register.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

static UIStoryboard    *storyboard;
static int iKeyboardHeight = 100;

@interface Register ()
@property (nonatomic,strong) NSDictionary   *diFacebookResult;
@end

@implementation Register
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
/**********************************************************************************************/
#pragma mark - Action methods methods
/**********************************************************************************************/
- (IBAction)btnNextPressed:(id)sender {
}
//-------------------------------------------------------------------------------
- (IBAction)btnMenuPressed:(id)sender {
}
//-------------------------------------------------------------------------------
- (IBAction)btnGooglePressed:(id)sender {
}
//-------------------------------------------------------------------------------
- (IBAction)btnFacebookPressed:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile",@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"] && [result.grantedPermissions containsObject:@"public_profile"]) {
                // Do work
                if ([FBSDKAccessToken currentAccessToken]) {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         if (!error) {
                             self.diFacebookResult = result;
                             NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
                             [self doLoginWithFacebook];
                         }
                     }];
                }
            }
        }
    }];
}
/**********************************************************************************************/
#pragma mark - Operation methods
/**********************************************************************************************/
- (void)doLoginWithFacebook {
    print(NSLog(@"self.diFacebookResult = %@", self.diFacebookResult))
    NSString *stName    = [self.diFacebookResult valueForKey:@"name"];
    NSString *stId      = [self.diFacebookResult valueForKey:@"id"];
    
    NSArray *items      = [stName componentsSeparatedByString:@" "];
    NSString *str1      = [items objectAtIndex:0];
    NSString *str2      = [items objectAtIndex:1];
    NSString *str3      = [items objectAtIndex:2];
    print(NSLog(@"stName = %@", stName));
    
    self.txtName.text           = str1;
    self.txtFirstSurname.text   = str2;
    self.txtSecondSurname.text  = str3;
}

/**********************************************************************************************/
#pragma mark - Text fields delegates
/**********************************************************************************************/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    print(NSLog(@"txtName"))
    /*if (textField == self.txtName) {
    }*/
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newString length] > 0) {
        if ([newString length] > nMaxTxtData) {
            return NO;
        }
    }
    return YES;
}
//-------------------------------------------------------------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    print(NSLog(@"textFieldDidBeginEditing"))
    if (textField == self.txtName) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup1.frame.origin.y + 20)  animated:YES];
    }
    else if (textField == self.txtFirstSurname) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup1.frame.origin.y + 20)  animated:YES];
    }
    else if (textField == self.txtSecondSurname) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup2.frame.origin.y - 10)  animated:YES];
    }
    else if (textField == self.txtEmail) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup3.frame.origin.y - 10)  animated:YES];
    }
    else if (textField == self.txtPhone) {
        [self.svRegister setContentOffset: CGPointMake(0, self.vDataGroup3.frame.origin.y - 10)  animated:YES];
    }
}
//-------------------------------------------------------------------------------
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    //Method for moving to the next textfield when the "next" key is pressed
    print(NSLog(@"textFieldShouldReturn"))
    if(textField.returnKeyType == UIReturnKeyNext) {
        if (textField == self.txtName) {
            [self.txtFirstSurname becomeFirstResponder];
        }
        else if (textField == self.txtFirstSurname) {
            [self.txtSecondSurname becomeFirstResponder];
        }
        else if (textField == self.txtSecondSurname) {
            //[self.txtSecondSurname becomeFirstResponder];
            [textField resignFirstResponder];
            //self.vPicker.hidden = NO;
        }
        else if (textField == self.txtEmail) {
            [self.txtPhone becomeFirstResponder];
        }
        else if (textField == self.txtPhone) {
            [self.txtPassword becomeFirstResponder];
        }
        else if (textField == self.txtPassword) {
            [self.txtPasswordConfirm becomeFirstResponder];
        }
        print(NSLog(@"UIReturnKeyNext"))
    } else if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    return YES;
}
/**********************************************************************************************/
#pragma mark - Keyboard methods
/**********************************************************************************************/
- (void)keyboardWillShow:(NSNotification *)notification {
    print(NSLog(@"keyboardDidShow"))
    CGSize keyboardSize     = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    iKeyboardHeight         = MIN(keyboardSize.height,keyboardSize.width);
    self.svRegister.contentSize = CGSizeMake(self.svRegister.frame.size.width, self.svRegister.frame.size.height + iKeyboardHeight + 40);
}



@end
