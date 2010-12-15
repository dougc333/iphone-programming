//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by doug chang on 10/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HomepwnerAppDelegate.h"


@implementation HomepwnerAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	itemsViewController = [[ItemsViewController alloc]init];
	[window addSubview:[itemsViewController view]];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
