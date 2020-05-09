//
//  GIPCybertruck.m
//  Cybertruck
//
//  Created by Gi Pyo Kim on 5/8/20.
//  Copyright © 2020 GIPGIP Studio. All rights reserved.
//

#import "GIPCybertruck.h"

@implementation GIPCybertruck

- (instancetype)initWithRange:(float)range
                      battery:(float)battery
                  temperature:(float)temperature
                       isACOn:(BOOL)isACOn
                     fanSpeed:(int)fanSpeed {
    self = [super init];
    if (self) {
        _range = range;
        _battery = battery;
        _temperature = temperature;
        _isACOn = isACOn;
        _fanSpeed = fanSpeed;
        _image = [UIImage imageNamed:@"cybertruck"];
    }
    return self;
}

@end
