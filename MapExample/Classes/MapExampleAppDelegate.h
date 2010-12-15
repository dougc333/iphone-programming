//
//  MapExampleAppDelegate.h
//  MapExample
//
//  Created by doug chang on 11/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapExampleAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate,MKMapViewDelegate> {
	CLLocationManager *locationManager;
	IBOutlet MKMapView *mapView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UITextField *locationTitleField;
	
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(void)findLocation;
-(void)foundLocation;

@end

