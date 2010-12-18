//
//  PistolGunVCTemplateAppDelegate.h
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PistolGunVCTemplateViewController;
//@class PhaserViewController;

@interface PistolGunVCTemplateAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PistolGunVCTemplateViewController *pistolGunViewController;
	//PhaserViewController *phaserViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PistolGunVCTemplateViewController *viewController;

@end

