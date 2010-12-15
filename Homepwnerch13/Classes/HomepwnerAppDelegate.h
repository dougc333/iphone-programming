//
//  HomepwnerAppDelegate.h
//  Homepwner
//
//  Created by doug chang on 10/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsViewController.h"
@class ItemsViewController;


@interface HomepwnerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	ItemsViewController *itemsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

