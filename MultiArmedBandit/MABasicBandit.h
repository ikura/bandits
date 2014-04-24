//
//  MABasicBandit.h
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MABanditAlgorithm.h"

typedef enum {
	kBinaryBandit,
	kDoubleBandit,
} MABanditType;


typedef enum {
	kIncreasing,
	kDecreasing,
} MABanditDirection;

@interface MABasicBandit : NSObject<MABanditAlgorithm>

@property (nonatomic, strong) NSMutableDictionary *banditFails;
@property (nonatomic, strong) NSMutableDictionary *banditSuccesses;
@property (nonatomic, strong) NSMutableDictionary *banditMu;

@property (nonatomic) MABanditType banditType;
@property (nonatomic) MABanditDirection banditDirection;

@property (nonatomic, copy) MABanditTrialDelegate delegate;

// Subclasses Can Override
- (NSString *)chooseBandit;

// Must call super
- (NSString *)runTrial;
- (void)addBanditName:(NSString *)name;

- (NSString *)anyBandit;

@end
