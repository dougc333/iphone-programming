#import <Foundation/Foundation.h>
#import "Account.h"


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
    NSLog(@"Test program for Account Class!");
	//first test the default initializer
	Account * acct = [[Account alloc] init];	
	NSLog(@"NSLog default init called should see 0.00 balance:%@",[acct description]);
	[acct deposit:100.00];
	NSLog(@"NSLog call deposit 100.00 should see 100.00 balance:%@",[acct description]);
	[acct withdraw:50.00];
	NSLog(@"NSLog call withdraw 50.00 should see 50.00 balance:%@",[acct description]);
	Account * secondAcct = [[Account alloc]init:1000.00];
	NSLog(@"NSLog init with 1000.00 should see 1000.00 balance:%@",[secondAcct description]);
	[secondAcct withdraw:2000.00];
	NSLog(@"NSLog withdraw 2000.00 should see 1000.00 balance:%@",[secondAcct description]);
	
	
    [pool drain];
    return 0;
}
