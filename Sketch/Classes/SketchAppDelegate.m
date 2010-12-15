//
//  SketchAppDelegate.m
//  Sketch
//
//  Created by doug chang on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SketchAppDelegate.h"

@implementation SketchAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
