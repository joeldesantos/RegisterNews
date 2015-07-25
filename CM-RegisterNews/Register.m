//
//  Register.m
//  CM-RegisterNews
//
//  Created by Walter Gonzalez Domenzain on 25/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Register.h"

@interface Register ()

@end

@implementation Register

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
