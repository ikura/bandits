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

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		MABandit *bandit = [[MABandit alloc] init];
		MASmartBandit *smartBandit = [[MASmartBandit alloc] init];
		smartBandit.epsilon = 1.0;
		bandit.algorithm = smartBandit;

		[bandit addBanditBlock:^BOOL{
			return (arc4random_uniform(100) < 7);
		} withName:@"A"];

		[bandit addBanditBlock:^BOOL{
			return (arc4random_uniform(100) < 9);
		} withName:@"B"];

		[bandit addBanditBlock:^BOOL{
			return (arc4random_uniform(100) < 8);
		} withName:@"C"];


		while (1)
		{
			NSLog(@"Chose bandit: %@", [bandit step]);
			NSLog(@"%@", bandit);
		}

	}
    return 0;
}

