//
//  TestNavControllerAppDelegate.h
//  TestNavController
//
//  Created by doug chang on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
 
@interface TestNavControllerAppDelegate : NSObject <UIApplicationDelegate> {
	UIView *newView;
	UILabel *myLabel;
    UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UILabel *myLabel;
@property (nonatomic, retain) UIView *newView;
@property (nonatomic, retain) UINavigationController *navController;

@end

