//
//  StarWarsTestAppDelegate.m
//  StarWarsTest
//
//  Created by doug chang on 8/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "StarWarsTestAppDelegate.h"

@implementation StarWarsTestAppDelegate

@synthesize window,firstName;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	NSLog(@"application did finish launching!!!");
    // Override point for customization after application launch
    [window makeKeyAndVisible];
	//return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	NSLog(@"TFSR is here!!!!");
	[[self firstName] resignFirstResponder];
	return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
	NSLog(@"text field did begin editing");
	
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
