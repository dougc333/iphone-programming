//
//  MapExampleAppDelegate.m
//  MapExample
//
//  Created by doug chang on 11/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapExampleAppDelegate.h"
#import "MapPoint.h"

@implementation MapExampleAppDelegate

@synthesize window;


-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray*)views{
	NSLog(@"didAddAnnotationViews");
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate],250, 250);
	//bug in book code, they have mv here.  
	[mapView setRegion:region animated:YES];
	NSLog(@"end annotation views");
}

-(BOOL)textFieldShouldReturn:(UITextField*)tf
{
	NSLog(@"text field should return");
	[self findLocation];
	[tf resignFirstResponder];
	return YES;
}

-(void)findLocation{
	NSLog(@"findLocation");
	[locationManager startUpdatingLocation];
	[activityIndicator startAnimating];
	[locationTitleField setHidden:YES];
}

-(void)foundLocation{
	NSLog(@"foundLocations");
	//The Enter Location is set in IB
	[locationTitleField setText:@""];
	[activityIndicator stopAnimating];
	[locationTitleField setHidden:NO];
	[locationManager stopUpdatingLocation];
//	[locationManager stopUpdatingHeading];
}

 -(void)locationManager:(CLLocationManager *) manager didUpdateToLocation:(CLLocation*)newLocation fromLocation:(CLLocation*)oldLocation{
	 NSLog(@"%@",newLocation);
	 NSTimeInterval t = [[newLocation timestamp ] timeIntervalSinceNow];
	 if (t < -180) {
		 return;
	 }
	 MapPoint *mp = [[MapPoint alloc] initWithCoordinate:[newLocation coordinate] title:[locationTitleField text]];
	 [mapView addAnnotation:mp];
	 [mp release];
	 [self foundLocation];
 }
 
 -(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError*) error{
	 NSLog(@"could not find location %@",error);
 }
 
 
 - (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
 //	xLabel.text = [NSString stringWithFormat:@"%.1f", heading.x];
 //	[yLabel setText:[NSString stringWithFormat:@"%.1f", heading.y]];
 //	[zLabel setText:[NSString stringWithFormat:@"%.1f", heading.z]];
 
 //  NSLog(@"heading.x:%.1f",heading.x);
 //  NSLog(@"heading.y:%.1f",heading.y);
 //  NSLog(@"heading.z:%.1f",heading.z);
 
 //	CGFloat magnitude = sqrt(heading.x*heading.x + heading.y*heading.y + heading.z*heading.z);
 //   [magnitudeLabel setText:[NSString stringWithFormat:@"%.5f", magnitude]];
 //	NSLog(@"magnitdue:%f", magnitude);
 }
 
 


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	NSLog(@"didfinishlaunching");
	locationManager = [[CLLocationManager alloc]init];
	[locationManager setDelegate:self];
	[locationManager setDistanceFilter:kCLDistanceFilterNone];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//	[locationManager startUpdatingLocation];
	//if([locationManager headingAvailable]){
	//	NSLog(@"heading available, how the hell do you print a heading?");
	//	[locationManager startUpdatingHeading];
	//}
	[mapView setShowsUserLocation:YES];
	//xLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
	//yLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
	//zLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
	//	magnitudeLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[locationManager setDelegate:nil];
    [window release];
    [super dealloc];
}


@end
