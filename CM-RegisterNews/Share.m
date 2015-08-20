//
//  Share.m
//  CM-RegisterNews
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Share.h"
@import FBSDKShareKit;

@interface Share ()

@end

@implementation Share

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)shareBtn:(id)sender {
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"http://www.uag.mx/"];
    content.contentDescription = @"Este post es una tarea de Computo Movil.";
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
}
@end
