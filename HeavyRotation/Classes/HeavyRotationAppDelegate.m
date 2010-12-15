//
//  HeavyRotationAppDelegate.m
//  HeavyRotation
//
//  Created by doug chang on 10/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HeavyRotationAppDelegate.h"
#import "HeavyViewController.h"

@implementation HeavyRotationAppDelegate

@synthesize window;

-(void) orientationChanged:(NSNotification *) note{
	UIDeviceOrientation value = [[note object] orientation];
	switch (value) {
		case UIDeviceOrientationPortrait:
			NSLog(@"orientation portraitz:%d",value);
			break;
		case UIDeviceOrientationPortraitUpsideDown:
			NSLog(@"orientation portraitUpsideDown:%d",value);
			break;
		case UIDeviceOrientationLandscapeLeft:
			NSLog(@"orientation portraitLeft:%d",value);
			break;
		case UIDeviceOrientationLandscapeRight:
			NSLog(@"orientation portraitRight:%d",value);
			break;
		case UIDeviceOrientationFaceUp:
			NSLog(@"orientation portraitFaceUp:%d",value);
			break;
		case UIDeviceOrientationFaceDown:
			NSLog(@"orientation portraitFaceDown:%d",value);
			break;
		default:
			break;
	}
	
	
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	UIDevice *device = [UIDevice currentDevice];
	[device	beginGeneratingDeviceOrientationNotifications];
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc addObserver:self selector:@selector(orientationChanged:) 
			   name:UIDeviceOrientationDidChangeNotification 
			   object:device];
	HeavyViewController *hvc = [[HeavyViewController alloc]init];
	[window addSubview:[hvc view]];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
