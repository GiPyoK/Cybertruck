//
//  GIPMainViewController.m
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import "GIPMainViewController.h"

@interface GIPMainViewController ()

@property (strong, nonatomic) CAGradientLayer *gradient;


@end

@implementation GIPMainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
        
    // Gradient Background
    self.gradient = [CAGradientLayer layer];
    UIColor *topColor = [UIColor colorWithRed:66.0f/255.0 green:71.0f/255.0 blue:80.0f/255.0 alpha:0.8f];
    UIColor *bottomColor = [UIColor colorWithRed:32.0f/255.0 green:35.0f/255.0 blue:38.0f/255.0 alpha:0.8f];
    self.gradient.colors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    self.gradient.frame = self.view.bounds;
    [self.view.layer insertSublayer:self.gradient atIndex:0];
}

// Handle screen rotation
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // execute before rotation
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        // execute during rotation
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        // execute after rotation
        self.gradient.frame = self.view.bounds;
    }];
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
