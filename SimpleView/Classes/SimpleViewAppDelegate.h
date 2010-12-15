//
//  SimpleViewAppDelegate.h
//  SimpleView
//
//  Created by doug chang on 9/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIView *myView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIView *myView;

@end

