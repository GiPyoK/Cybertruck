//
//  GIPCybertruck.h
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GIPCybertruck : NSObject

@property (nonatomic) float range;          // miles
@property (nonatomic) float battery;        // percentage
@property (nonatomic) float temperature;    // fahrenheit
@property (nonatomic) BOOL isACOn;
@property (nonatomic) int fanSpeed;
@property (nonatomic) UIImage *image;

- (instancetype)initWithRange:(float)range
                      battery:(float)battery
                  temperature:(float)temperature
                       isACOn:(BOOL)isACOn
                     fanSpeed:(int)fanSpeed;

@end

NS_ASSUME_NONNULL_END
