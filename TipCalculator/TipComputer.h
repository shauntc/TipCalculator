//
//  TipComputer.h
//  TipCalculator
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipComputer : NSObject

+(float)calculateTip:(float)billAmount tipPercent:(float)tipPercent;

@end

