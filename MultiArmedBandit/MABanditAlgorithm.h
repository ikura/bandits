//
//  MABanditAlgorithm.h
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSNumber*(^MABanditTrialDelegate)(NSString *name);

// Abstract Interface for MABanditAlgorithm

@protocol MABanditAlgorithm


- (void)addBanditName:(NSString *)name;

// This will call the delegate with the name of the bandit to operate
// The delegate returns Success or Failure and the Algorithm updates it's state accordingly
// This method then returns the name of the arm pulled
- (NSString *)runTrial;

// Delegate block for bandit trials
@property (nonatomic, copy) MABanditTrialDelegate delegate;

// String for description
@property (nonatomic, readonly) NSString *description;

@end
