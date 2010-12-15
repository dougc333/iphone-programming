//
//  Account.m
//  BankAccount
//
//  Created by doug chang on 8/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Account.h"


@implementation Account
//@synthesize balance;


//you should use setBalance,getBalance in the deposit and withdrawl methods
//else you have to make sure the memory management is done correctly;
//these are primitives, you don't need to manage the memory. on stack, not on heap.

-(id)init{
	NSLog(@"calling default init");
	return [self init:0];
}

-(id)init:(float)initialBalance{
	self = [super init];
	if (!self) {
		return nil;
	}
	if (initialBalance >= 0) {
		balance = initialBalance;
		return self;
	}else{
		NSLog(@"initial balance has to be >=0 try again");
		return nil; 
	}
}
-(void)deposit:(float)depositAmount{
	balance = balance + depositAmount;
}
-(void)withdraw:(float) withdrawAmount{
	if(balance - withdrawAmount >= 0){
		balance = balance - withdrawAmount;
	}else{
		NSLog(@"Withdraw amount exceeds balance, try again");
	}
	
}

-(NSString *)description{
	//NSLog(@"description balance:%f",balance);
	//when using NSString with stringWithFormat, the string is autoreleased automatically
	//if you use NSString with init then you have to call autorelease. 
	return [NSString stringWithFormat:@"%.2f",balance];
}
@end
