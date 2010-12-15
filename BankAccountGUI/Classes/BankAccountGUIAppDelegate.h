//
//  BankAccountGUIAppDelegate.h
//  BankAccountGUI
//
//  Created by doug chang on 9/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankAccountGUIAppDelegate : NSObject <UIApplicationDelegate> {
	NSDecimalNumber *accountBalance;
	UILabel *balance;
	UITextField *depositOrWithdrawlAmount;
	UIWindow *window;
	
}

@property (nonatomic, retain) NSDecimalNumber *accountBalance;
@property (nonatomic, retain) IBOutlet UILabel *balance;
@property (nonatomic, retain) IBOutlet UITextField *depositOrWithdrawlAmount;
@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction) withdrawl;
-(IBAction) deposit;


@end

