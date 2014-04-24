//
//  MASmartBandit.m
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import "MASmartBandit.h"

@interface MASmartBandit()

@end

@implementation MASmartBandit

- (BOOL)chooseBest
{
	const u_int32_t maxInt = (u_int32_t)-1;
	u_int32_t random = arc4random_uniform(maxInt);

	if (((double)maxInt) * self.epsilon <= (double)random) return YES;
	else return NO;
}

- (NSString *)bestBandit
{
	NSString *best = self.banditMu.allKeys.firstObject;

	for (NSString *bandit in self.banditMu.allKeys)
	{
		if ([self.banditMu[bandit] doubleValue] > [self.banditMu[best] doubleValue]) best = bandit;
	}

	return best;
}

- (NSString *)chooseBandit
{
	if ([self chooseBest]) return [self bestBandit];
	else return [self anyBandit];
}

- (void)addBanditName:(NSString *)name
{
	self.banditMu[name] = @1;
	[super addBanditName:name];
}

- (NSString *)runTrial
{
	self.epsilon = self.epsilon * 0.99;
	return [super runTrial];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"MA Smart Bandit with epsilon = %.4G\r\nMeans: %@", self.epsilon, self.banditMu];
}



@end
