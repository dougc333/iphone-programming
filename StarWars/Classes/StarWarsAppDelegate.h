//
//  StarWarsAppDelegate.h
//  StarWars
//
//  Created by doug chang on 8/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarWarsAppDelegate : NSObject <UIApplicationDelegate,UITextFieldDelegate> {
    NSString *defaultFirstName; 
	NSString *defaultLastName;
	NSString *defaultMaidenName;
	NSString *defaultCityName; 
	
	UIWindow *window;
	UITextField *lastName;
	UITextField *firstName;
	UITextField *maidenName;
	UITextField *city;
	UILabel *starWarsName;
}
@property (nonatomic,retain) NSString *defaultFirstName;
@property (nonatomic,retain) NSString *defaultLastName;
@property (nonatomic,retain) NSString *defaultMaidenName;
@property (nonatomic,retain) NSString *defaultCityName;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) 	IBOutlet UITextField *lastName;
@property (nonatomic, retain) 	IBOutlet UITextField *firstName;
@property (nonatomic, retain) 	IBOutlet UITextField *maidenName;
@property (nonatomic, retain) 	IBOutlet UITextField *city;
@property (nonatomic, retain) IBOutlet UILabel *starWarsName;

-(IBAction) generateStarWarsName;

@end

