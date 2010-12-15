//
//  WhereAmIAppDelegate.h
//  WhereAmI
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereAmIAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
//	CLLocationManager *locationManager;
//	IBOutlet MKMapView *mapView;
//	IBOutlet UIActivityIndicatorView *activityIndicator;
//	IBOutlet UITextField *locationTitleField;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

