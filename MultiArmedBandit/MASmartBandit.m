//
//  MASmartBandit.m
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import "MASmartBandit.h"

@interface MASmartBandit()

@property (nonatomic, strong) NSMutableDictionary *banditMu;

@end

@implementation MASmartBandit

- (NSMutableDictionary *)banditMu
{
	if (_banditMu) return _banditMu;
	else return _banditMu = NSMutableDictionary.dictionary;
}

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
	NSString *result = [super runTrial];

	double F = [self.banditFails[result] doubleValue];
	double S = [self.banditSuccesses[result] doubleValue];

	self.banditMu[result] = @(S / (S + F));
	self.epsilon = self.epsilon * 0.99;
	return result;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"MA Smart Bandit with epsilon = %.4G\r\nMeans: %@", self.epsilon, self.banditMu];
}



@end
