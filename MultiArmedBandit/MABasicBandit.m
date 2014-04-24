//
//  MABasicBandit.m
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import "MABasicBandit.h"

@interface MABasicBandit()


@end

@implementation MABasicBandit {
}

- (NSMutableDictionary *)banditSuccesses
{
	if (_banditSuccesses) return _banditSuccesses;
	else return _banditSuccesses = NSMutableDictionary.dictionary;
}

- (NSMutableDictionary *)banditFails
{
	if (_banditFails) return _banditFails;
	else return _banditFails = NSMutableDictionary.dictionary;
}

- (NSString *)anyBandit
{
	return self.banditSuccesses.allKeys[arc4random_uniform((u_int32_t)self.banditSuccesses.count)];
}

- (NSString *)chooseBandit
{
	// Just choose them randomly - will be lame

	return [self anyBandit];
}

- (NSString *)runTrial
{
	NSString *bandit = [self chooseBandit];

	if (self.delegate(bandit)) self.banditSuccesses[bandit] = @([self.banditSuccesses[bandit] integerValue] + 1);
	else
		self.banditFails[bandit] = @([self.banditFails[bandit] integerValue] + 1);

	return bandit;
}

- (void)addBanditName:(NSString *)name
{
	self.banditFails[name] = @0;
	self.banditSuccesses[name] = @0;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"MA Basic Bandit\r\nSuccesses: %@\r\nFails: %@", self.banditSuccesses, self.banditFails];
}

@end
