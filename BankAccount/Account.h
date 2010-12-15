//
//  Account.h
//  BankAccount
//
//  Created by doug chang on 8/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Account : NSObject {
	float balance;
}

//@property (nonatomic,retain) float balance;

//-(id)init;
-(id)init:(float)initialBalance;
-(void)deposit:(float) depositAmount;
-(void)withdraw: (float) withdrawAmount;
-(NSString *)description;


@end
