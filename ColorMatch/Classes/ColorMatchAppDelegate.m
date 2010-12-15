//
//  ColorMatchAppDelegate.m
//  ColorMatch
//
//  Created by doug chang on 10/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ColorMatchAppDelegate.h"
#import "ColorMatchViewController.h"

@implementation ColorMatchAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	ColorMatchViewController *cmc = [[ColorMatchViewController alloc]init];
    [window addSubview:[cmc view]];
	[cmc updateRandomLabel];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
