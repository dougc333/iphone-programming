//
//  BankAccountGUIAppDelegate.m
//  BankAccountGUI
//
//  Created by doug chang on 9/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "BankAccountGUIAppDelegate.h"


@implementation BankAccountGUIAppDelegate
@synthesize window,balance,depositOrWithdrawlAmount,accountBalance;

-(id) init{
	self = [super init];
	if(!self){
		NSLog(@"error initializing super");
	}
	return self;
}

// if not digit generate an alert
-(BOOL)isDigit:(NSString *) isStringaNumber{
	for (int i=0; i<[isStringaNumber length]; i++) {
		char testMe = [isStringaNumber characterAtIndex:i];
		if(!isdigit(testMe) && testMe!='.'){
			NSLog(@"not digit or decimal in input");
			return NO;
		}
		NSLog(@"char:%c",testMe);
	}
	return YES;
}

-(IBAction) withdrawl{
	NSString *amount = depositOrWithdrawlAmount.text;
	if (![self isDigit:amount]) {
		//generate alert saying input is not a number, clear the text box
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid text entered" 
														message:@"Valid Number Not Entered!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
		depositOrWithdrawlAmount.text=@"";
	}else{
		float accountBalanceFloat = [accountBalance doubleValue];
		float withdrawFloat = [amount floatValue];
		float newBalance = accountBalanceFloat - withdrawFloat;
		NSLog(@"newBalance:%f",newBalance);
		NSString *nBal = [[[NSString alloc] initWithFormat:@"%f",newBalance ]autorelease ];
		NSLog(@"nBal:%@",nBal);
		accountBalance = [[NSDecimalNumber alloc] initWithString:nBal];
		NSString *dollarSign = [[[NSString alloc] initWithString:@"$"] autorelease];
		NSString *amountToDisplay = [[NSString alloc] initWithFormat:@"%.2f", [accountBalance doubleValue]];
		balance.text = [dollarSign stringByAppendingString:amountToDisplay];
	}
}

-(IBAction) deposit{
	NSString *amount = depositOrWithdrawlAmount.text;
	if (![self isDigit:amount]) {
		//generate alert saying input is not a number, clear the text box
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid text entered" 
														message:@"Valid Number Not Entered!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
		depositOrWithdrawlAmount.text=@"";
	}else{
		//add amount to account balance and display new amount
		float accountBalanceFloat = [accountBalance doubleValue];
		float withdrawFloat = [amount floatValue];
		float newBalance = accountBalanceFloat + withdrawFloat;
		NSLog(@"newBalance:%f",newBalance);
		NSString *nBal = [[[NSString alloc] initWithFormat:@"%f",newBalance ]autorelease];
		NSLog(@"nBal:%@",nBal);
		accountBalance = [[NSDecimalNumber alloc] initWithString:nBal];
		NSString *dollarSign = [[[NSString alloc] initWithString:@"$"] autorelease];
		NSString *amountToDisplay =[[NSString alloc] initWithFormat:@"%.2f", [accountBalance doubleValue]];
		balance.text = [dollarSign stringByAppendingString:amountToDisplay];
	}
	
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	accountBalance = [[NSDecimalNumber alloc] initWithString:@"1000.00"];
	//append dollar sign
	NSString *dollarSign = [[[NSString alloc] initWithString:@"$"] autorelease];
	NSString *amount=[[[NSString alloc] initWithFormat:@"%.2f", [accountBalance doubleValue]]autorelease ];
	balance.text = [dollarSign stringByAppendingString:amount];
	NSLog(@"accountBalance decimal value:%f",[accountBalance doubleValue]);
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[accountBalance release];
	[balance release];
	[depositOrWithdrawlAmount release];
    [window release];
    [super dealloc];
}


@end
