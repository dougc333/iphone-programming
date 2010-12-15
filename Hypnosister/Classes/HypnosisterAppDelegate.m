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
	//add a random component to this center
	reallyBigRect.origin = CGPointZero;
	reallyBigRect.size.width = wholeWindow.size.width * 2.0;
	reallyBigRect.size.height = wholeWindow.size.height * 2.0;
	[scrollView setContentSize:reallyBigRect.size];
	
	//center in UIScrollView
	CGPoint offset;
	NSArray *nsd = [NSArray arrayWithObject:[NSValue valueWithCGPoint:offset]];
	offset.x = wholeWindow.size.width * 0.5;
	offset.y = wholeWindow.size.height * 0.5;
	[scrollView setContentOffset:offset];
	
	[scrollView setMinimumZoomScale:0.5];
	[scrollView setMaximumZoomScale:5];
	[scrollView setDelegate:self];
	
	view = [[HypnosisView alloc] initWithFrame:reallyBigRect];
	[view setBackgroundColor:[UIColor redColor]];
	[scrollView addSubview:view];
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:.01 
								   target:self
								   selector:@selector(foo:)
								   userInfo:nsd
								   repeats:YES ];
	[window makeKeyAndVisible];
}


-(void)foo:(NSTimer *) timer {
	//NSArray *temp = [timer userInfo];
	//the posts on the internet are wrong, next line is for documentation, do not remove
	//NSValue *nv= (NSValue*)[temp objectAtIndex:0];
	CGPoint newOffset;
	newOffset.x = arc4random()%100+10;
	newOffset.y = arc4random()%100+20;
	[[[window subviews] objectAtIndex:0] setContentOffset:newOffset];
	//do you need the setDisplay message? No the system knows when you change data. 
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
