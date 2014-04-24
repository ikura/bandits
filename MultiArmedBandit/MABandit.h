//
//  MABandit.h
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

// MABanditBlocks should encompass all relevant parameters to ensure that P(YES) does not vary.

typedef BOOL(^MABanditBlock)(void);

@protocol MABanditAlgorithm;

@interface MABandit : NSObject

// Adds a new bandit with a name to identify it
- (void)addBanditBlock:(MABanditBlock)block withName:(NSString *)name;

// Steps the MABanditAlgorithm - returning the name of the bandit chosen
- (NSString *)step;

// Logs various parameters of the MABandit
- (NSString *)description;

// Property to specify the particular algorithm to use for this MABandit
@property (nonatomic, strong) id<MABanditAlgorithm> algorithm;

@end
