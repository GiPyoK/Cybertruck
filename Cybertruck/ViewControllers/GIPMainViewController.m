//
//  GIPMainViewController.m
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import "GIPMainViewController.h"

@interface GIPMainViewController ()

@end

@implementation GIPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
        
    // Gradient Background
    UIColor *topColor = [UIColor colorWithRed:66.0f/255.0 green:71.0f/255.0 blue:80.0f/255.0 alpha:0.8f];
    UIColor *bottomColor = [UIColor colorWithRed:32.0f/255.0 green:35.0f/255.0 blue:38.0f/255.0 alpha:0.8f];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    gradient.frame = self.view.bounds;
    [self.view.layer insertSublayer:gradient atIndex:0];
    
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
