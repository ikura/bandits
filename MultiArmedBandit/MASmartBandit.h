//
//  MASmartBandit.h
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import "MABasicBandit.h"

@interface MASmartBandit : MABasicBandit

// Epsilon Greedy

@property (nonatomic) double epsilon;
@property (nonatomic) double epsilonScaleFactor;

@end
