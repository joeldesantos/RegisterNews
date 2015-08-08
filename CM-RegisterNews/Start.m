//
//  ViewController.m
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Start.h"
#import "Register.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    [self playVideo];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
    self.lblBtnLogin.layer.borderColor    = [UIColor whiteColor].CGColor;
    self.lblBtnLogin.layer.borderWidth    = 1;
    self.lblBtnLogin.clipsToBounds        = YES;
    self.lblBtnLogin.layer.cornerRadius   = 8;
    
    self.lblBtnRegister.layer.borderColor    = [UIColor whiteColor].CGColor;
    self.lblBtnRegister.layer.borderWidth    = 1;
    self.lblBtnRegister.clipsToBounds        = YES;
    self.lblBtnRegister.layer.cornerRadius   = 8;
}
/**********************************************************************************************/
#pragma mark - Video method
/**********************************************************************************************/
-(void)playVideo {
    //Play video
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"mp4"];
    NSURL *videoUrl     = [NSURL fileURLWithPath:videoPath];
    
    self.moviePlayer    =[[MPMoviePlayerController alloc] initWithContentURL:videoUrl];
    [self.moviePlayer.view setFrame:CGRectMake(0, 0, 1136, 640)];
    
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer setShouldAutoplay:YES];
    [self.moviePlayer setRepeatMode:MPMovieRepeatModeOne];
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    [self.vVideo addSubview:self.moviePlayer.view];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:[UIApplication sharedApplication] queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self.moviePlayer play];
    }];
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/

- (IBAction)btnLoginPressed:(id)sender {
}

- (IBAction)btnRegisterPressed:(id)sender {
    Register *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"Register"];
    [self presentViewController:vc animated:YES completion:nil];
}










@end
