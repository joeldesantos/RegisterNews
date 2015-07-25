//
//  ViewController.h
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

@interface Start : UIViewController
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) IBOutlet UIView *vVideo;
@property (strong, nonatomic) IBOutlet UILabel *lblBtnLogin;
@property (strong, nonatomic) IBOutlet UILabel *lblBtnRegister;

//Actions
- (IBAction)btnLoginPressed:(id)sender;
- (IBAction)btnRegisterPressed:(id)sender;


@end

