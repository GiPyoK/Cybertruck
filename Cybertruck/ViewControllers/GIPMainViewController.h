//
//  GIPMainViewController.h
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GIPCybertruck;

NS_ASSUME_NONNULL_BEGIN

@interface GIPMainViewController : UIViewController

@property (nonatomic) GIPCybertruck *cybertruck;

- (void)makeGradientBackground;

- (void)setupLabels;

- (void)removeSubviews;

@end

NS_ASSUME_NONNULL_END
