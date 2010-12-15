//
//  PickerTestAppDelegate.h
//  PickerTest
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerTestAppDelegate : NSObject <UIApplicationDelegate,UIPickerViewDelegate,UIPickerViewDataSource> {
    UIWindow *window;
	UIPickerView *picker;
	NSArray *pickerData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) NSArray *pickerData;

@end

