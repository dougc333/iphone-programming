//
//  StarWarsTestAppDelegate.h
//  StarWarsTest
//
//  Created by doug chang on 8/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarWarsTestAppDelegate : NSObject <UIApplicationDelegate,UITextFieldDelegate> {
    UIWindow *window;
	UITextField *firstName;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITextField *firstName;

@end

