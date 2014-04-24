//
//  main.m
//  MultiArmedBandit
//
//  Created by Price Stephen on 22/04/2014.
//  Copyright (c) 2014 Ikura Group Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MABandit.h"
#import "MASmartBandit.h"

void setupBinaryArms(MABandit *bandit);
void setupDoubleArms(MABandit *bandit);

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		MABandit *bandit = [[MABandit alloc] init];
		
		MASmartBandit *smartBandit = [[MASmartBandit alloc] init];
		smartBandit.banditType = kDoubleBandit;
		
		smartBandit.epsilon = 1.0;
		smartBandit.epsilonScaleFactor = 0.999;
		bandit.algorithm = smartBandit;

//		setupBinaryArms(bandit);
		setupDoubleArms(bandit);
		while (1)
		{
			NSLog(@"Chose bandit: %@", [bandit step]);
			NSLog(@"%@", bandit);
		}

	}
    return 0;
}

void setupBinaryArms(MABandit *bandit)
{
	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(100) < 7);
	} withName:@"A"];

	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(100) < 9);
	} withName:@"B"];

	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(100) < 8);
	} withName:@"C"];
}


void setupDoubleArms(MABandit *bandit)
{
	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(1000));
	} withName:@"A"];

	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(100));
	} withName:@"B"];

	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(99));
	} withName:@"C"];

	[bandit addBanditBlock:^NSNumber *{
		return @(arc4random_uniform(1001));
	} withName:@"D"];
}
