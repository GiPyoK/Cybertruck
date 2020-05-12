//
//  GIPMainViewController.m
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import "GIPMainViewController.h"
#import "GIPCybertruck.h"
#import <UIKit/UIKit.h>

@interface GIPMainViewController ()

@property (nonatomic) CAGradientLayer *gradientLayer;
@property (nonatomic) UILabel *teslaLabel;
@property (nonatomic) UILabel *cybertruckLabel;
@property (nonatomic) UIImageView *truckImageView;

@end

@implementation GIPMainViewController

- (GIPCybertruck *)cybertruck {
    if (!_cybertruck) {
        _cybertruck = [[GIPCybertruck alloc] initWithRange:297.0f
                                                   battery:59.4f
                                               temperature:78.0f
                                                    isACOn:YES
                                                  fanSpeed:3];
    }
    return _cybertruck;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeGradientBackground];
    [self setupUI];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//}

- (void)makeGradientBackground {
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.gradientLayer = [CAGradientLayer layer];
    UIColor *topColor = [UIColor colorWithRed:66/255.0 green:71/255.0 blue:80/255.0 alpha:0.8];
    UIColor *bottomColor = [UIColor colorWithRed:32/255.0 green:35/255.0 blue:38/255.0 alpha:0.8];
    self.gradientLayer.colors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    self.gradientLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)setupUI {
    UIFont *latoBlack50 = [UIFont fontWithName:@"Lato-Black" size:50.0f];
    UIFont *latoRegular24 = [UIFont fontWithName:@"Lato-Regular" size:24.0f];
    
    float viewWidth = self.view.bounds.size.width;
    float viewHeight = self.view.bounds.size.height;
    
    // Tesla Label
    self.teslaLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.teslaLabel.text = @"Tesla";
    self.teslaLabel.font = latoRegular24;
    self.teslaLabel.backgroundColor = [UIColor clearColor];
    self.teslaLabel.textColor = [UIColor colorWithRed:127/255.0 green:132/255.0 blue:137/255.0 alpha:1.0];
    self.teslaLabel.textAlignment = NSTextAlignmentCenter;
    
    self.teslaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.teslaLabel];
    [self.teslaLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.teslaLabel.centerYAnchor constraintEqualToAnchor:self.view.topAnchor
                                                  constant:viewHeight * 0.17].active = YES;
    [self.teslaLabel.widthAnchor constraintEqualToConstant:83.0].active = YES;
    [self.teslaLabel.heightAnchor constraintEqualToConstant:28.0].active = YES;
    
    // Cybertruck Label
    self.cybertruckLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.cybertruckLabel.text = @"Cybertruck";
    self.cybertruckLabel.font = latoBlack50;
    self.cybertruckLabel.backgroundColor = [UIColor clearColor];
    self.cybertruckLabel.textColor = [UIColor colorWithRed:253/255.0 green:253/255.0 blue:253/255.0 alpha:1.0];
    self.cybertruckLabel.textAlignment = NSTextAlignmentCenter;
    
    self.cybertruckLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.cybertruckLabel];
    NSLayoutConstraint *cybertruckTopConstraint = [NSLayoutConstraint constraintWithItem:self.cybertruckLabel
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.teslaLabel
                                                                               attribute:NSLayoutAttributeBottom
                                                                              multiplier:1.0f
                                                                                constant:10.0f];

    NSLayoutConstraint *cybertruckXConstraint = [NSLayoutConstraint constraintWithItem:self.cybertruckLabel
                                                                               attribute:NSLayoutAttributeCenterX
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                               attribute:NSLayoutAttributeCenterX
                                                                              multiplier:1.0f
                                                                                constant:10.0f];
    
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:cybertruckTopConstraint, cybertruckXConstraint, nil]];
    
    // Cybertruck Image View
    self.truckImageView = [[UIImageView alloc] initWithImage:self.cybertruck.image];
    [self.truckImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    self.truckImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.truckImageView];
    [self.truckImageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.truckImageView.heightAnchor constraintEqualToConstant:viewHeight * 0.279].active = YES;
    [self.truckImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.truckImageView.widthAnchor constraintEqualToAnchor:self.truckImageView.heightAnchor
                                                  multiplier:1.6].active = YES;
    
    
}

- (void)removeSubviews {
    [self.teslaLabel removeFromSuperview];
    [self.truckImageView removeFromSuperview];
}

// Handle screen rotation
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // execute before rotation
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        // execute during rotation
        [self removeSubviews];
        self.gradientLayer.frame = self.view.bounds;
        [self setupUI];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        // execute after rotation
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
