//
//  MABandit.m
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import "MABandit.h"
#import "MABanditAlgorithm.h"

@interface MABandit()

@property (nonatomic, strong) NSMutableDictionary *bandits;

@end

@implementation MABandit

- (NSMutableDictionary *)bandits
{
	if (_bandits) return _bandits;
	else return _bandits = NSMutableDictionary.dictionary;
}

- (id<MABanditAlgorithm>)algorithm
{
	__weak MABandit *weakSelf = self;
	if (_algorithm.delegate == nil) {
		_algorithm.delegate = ^(NSString *name){
			MABanditBlock block = weakSelf.bandits[name];
			return block();
		};
	}

	return _algorithm;
}

- (void)addBanditBlock:(MABanditBlock)block withName:(NSString *)name
{
	self.bandits[name] = [block copy];
	[self.algorithm addBanditName:name];
}

- (NSString *)step
{
	return [self.algorithm runTrial];
}

- (NSString *)description
{
	return self.algorithm.description;
}

@end
