//
//  StarWarsAppDelegate.m
//  StarWars
//
//  Created by doug chang on 8/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "StarWarsAppDelegate.h"

@implementation StarWarsAppDelegate

@synthesize window,firstName,lastName,maidenName,city,starWarsName;


-(IBAction) generateStarWarsName{
	NSString *fName = firstName.text;
	NSString *lName = lastName.text;
	NSString *mName = maidenName.text;
	NSString *cName = city.text;
	
	if( (fName !=nil) && (lName !=nil) && (mName !=nil) && (cName !=nil)){
		NSRange firstNameAndMaidenRange = NSMakeRange(0, 2);
		NSRange lastNameAndCityRange = NSMakeRange(0, 3);
		
		NSString *firstPartStarWarsName = [fName substringWithRange:firstNameAndMaidenRange];
		NSString *addSecondPart = [firstPartStarWarsName stringByAppendingString:[lName substringWithRange:lastNameAndCityRange]];
		NSString *addThirdPart = [addSecondPart stringByAppendingString:[mName substringWithRange:firstNameAndMaidenRange]];
		NSString *addFourthPart = [addThirdPart stringByAppendingString:[cName substringWithRange:lastNameAndCityRange]];
		
		//write to the label
		starWarsName.text = addFourthPart;
		
		//clear the text boxes so we can enter new names
		firstName.text = @"Enter First Name";
		lastName.text = @"Enter Last Name";
		maidenName.text = @"Enter Maiden Name";
		city.text = @"Enter City Name";
		
		//do we need this? there is no keyboard here!
		[firstName resignFirstResponder];
		[lastName resignFirstResponder];
		[maidenName resignFirstResponder];
		[city resignFirstResponder];
				
	}
	 
}


-(BOOL)textFieldShouldReturn:(UITextField *) textField{
	[textField resignFirstResponder];
	return YES;
	
}




- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    starWarsName.text = nil;
	[window makeKeyAndVisible];
}


- (void)dealloc {
	[firstName release];
	[lastName release];
	[maidenName release];
	[city release];
	[starWarsName release];
    [window release];
    [super dealloc];
}


@end
