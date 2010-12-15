//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by doug chang on 9/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;


@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate,UIScrollViewDelegate> {
    UIWindow *window;
	HypnosisView *view;
	UIView *firstPage;
	UIView *secondPage;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

