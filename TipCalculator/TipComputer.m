//
//  TipComputer.m
//  TipCalculator
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "TipComputer.h"

@implementation TipComputer

+(float)calculateTip:(float)billAmount tipPercent:(float)tipPercent
{
    return billAmount * tipPercent / 100;
}

@end
