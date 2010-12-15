//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by doug chang on 9/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	CGRect wholeWindow = [window bounds];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:wholeWindow];
	[window addSubview:scrollView];
	[scrollView release];
	
	CGRect reallyBigRect;
	reallyBigRect.origin = CGPointZero;
	reallyBigRect.size.width = wholeWindow.size.width * 3.0;
	reallyBigRect.size.height = wholeWindow.size.height;

	NSLog(@"wholeWindow bounds.width:%f bounds.heightR:%f", [window bounds].size.width , [window bounds].size.height);

	[scrollView setContentSize:reallyBigRect.size];
	
	[scrollView setDelegate:self];
	
	CGRect oneWindow;
	oneWindow.origin = CGPointZero;
	oneWindow.size.width = wholeWindow.size.width;
	oneWindow.size.height = wholeWindow.size.height;
	
	view = [[HypnosisView alloc] initWithFrame:oneWindow];
	[view setBackgroundColor:[UIColor redColor]];
	
	oneWindow.origin.x = wholeWindow.size.width+oneWindow.origin.x;
	firstPage = [[UIView alloc] initWithFrame:oneWindow];
	[firstPage setBackgroundColor:[UIColor blueColor]];

	
	oneWindow.origin.x = wholeWindow.size.width+oneWindow.origin.x;
	secondPage = [[UIView alloc] initWithFrame:oneWindow];
	[secondPage setBackgroundColor:[UIColor greenColor]];
	
	[scrollView addSubview:firstPage];
	[scrollView addSubview:view]; //note if you dont add view to the window the HypnosisView view drawRect won't get called. 
	[scrollView addSubview:secondPage];
	[scrollView setPagingEnabled:YES];
	
	
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
	[window makeKeyAndVisible];
}


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	return view;
}


- (void)dealloc {
	[view release];
    [window release];
    [super dealloc];
}


@end
