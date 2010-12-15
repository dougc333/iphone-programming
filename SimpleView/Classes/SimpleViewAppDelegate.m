//
//  SimpleViewAppDelegate.m
//  SimpleView
//
//  Created by doug chang on 9/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SimpleViewAppDelegate.h"

@implementation SimpleViewAppDelegate

@synthesize window,myView;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[self.myView setNeedsDisplay];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	
    [window release];
	self.myView = nil;
    [super dealloc];
}


@end
