//
//  PageAppDelegate.h
//  Page
//
//  Created by doug chang on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PageViewController;

@interface PageAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	PageViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PageViewController *viewController;

@end

