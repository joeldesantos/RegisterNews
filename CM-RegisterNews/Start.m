//
//  ViewController.m
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    [self playVideo];
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


@end
