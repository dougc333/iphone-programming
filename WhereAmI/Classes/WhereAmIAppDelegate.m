//
//  WhereAmIAppDelegate.m
//  WhereAmI
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "WhereAmIAppDelegate.h"

@implementation WhereAmIAppDelegate

@synthesize window;

/**
-(void)locationManager:(CLLocationManager *) manager didUpdateToLocation:(CLLocation*)newLocation fromLocation:(CLLocation*)oldLocation{
	NSLog(@"calling didupdatetolocation");
	NSLog(@"%@",newLocation);
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

*/

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    NSLog(@"didfinishlaunching");
//	locationManager = [[CLLocationManager alloc]init];
//	[locationManager setDelegate:self];
//	[locationManager setDistanceFilter:kCLDistanceFilterNone];
//	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//	[locationManager startUpdatingLocation];
	//if([locationManager headingAvailable]){
	//	NSLog(@"heading available, how the hell do you print a heading?");
	//	[locationManager startUpdatingHeading];
	//}
	//[mapView setShowsUserLocation:YES];
	//xLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
	//yLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
	//zLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
//	magnitudeLabel.text = [[NSString alloc] initWithFormat:@"%.1f",0.0 ];
    [window makeKeyAndVisible];
}

- (void)dealloc {
//	[locationManager setDelegate:nil];
    [window release];
    [super dealloc];
}

@end
