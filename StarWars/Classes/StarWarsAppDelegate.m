//
//  StarWarsAppDelegate.m
//  StarWars
//
//  Created by doug chang on 8/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "StarWarsAppDelegate.h"

@implementation StarWarsAppDelegate

@synthesize window,firstName,lastName,maidenName,city,starWarsName,defaultFirstName,defaultLastName,defaultMaidenName,defaultCityName;

// this is a private function only for this class
//we can fire a boolean variable to act as a one shot till
//they get the input correct. 
//
-(void) checkName{
	NSString *fName = firstName.text;
	NSString *lName = lastName.text;
	NSString *mName = maidenName.text;
	NSString *cName = city.text;
	
	while( [fName isEqualToString:defaultFirstName] || [lName isEqualToString:defaultLastName] || [mName isEqualToString:defaultMaidenName] || [cName isEqualToString:defaultCityName] )
	{
		NSLog(@"at least one of the text boxes is empty");
		
		if([fName isEqualToString:defaultFirstName]){
			NSLog(@"First Name not input!!!!");
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"First Name Alert" 
															message:@"First Name Not input!!!"
														   delegate:self 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil
								  ];
			[alert show];    
			[alert release];
		}
		
		if([lName isEqualToString:defaultLastName]){
			NSLog(@"Last Name not input!!!!");
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Last Name Alert" 
															message:@"Last Name Not input!!!"
														   delegate:self 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil
								  ];
			[alert show];    
			[alert release];
			
		}
		
		if([mName isEqualToString:defaultMaidenName]){
			NSLog(@"Maiden Name not input!!!!");
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Maiden Name Alert" 
															message:@"Maiden Name Not input!!!"
														   delegate:self 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil
								  ];
			[alert show];    
			[alert release];
			
		}
		
		
		if([cName isEqualToString:defaultCityName]){
			NSLog(@"City Name not input!!!!");
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"City Name Alert" 
															message:@"City Name Not input!!!"
														   delegate:self 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil
								  ];
			[alert show];    
			[alert release];
			
		}
	}
	
}

-(IBAction) generateStarWarsName{
	NSString *fName = firstName.text;
	NSString *lName = lastName.text;
	NSString *mName = maidenName.text;
	NSString *cName = city.text;
	
	if([fName isEqualToString:defaultFirstName]){
		NSLog(@"First Name not input!!!!");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"First Name Alert" 
														message:@"First Name Not input!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
	}
	
	if([lName isEqualToString:defaultLastName]){
		NSLog(@"Last Name not input!!!!");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Last Name Alert" 
														message:@"Last Name Not input!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
		
	}
	
	if([mName isEqualToString:defaultMaidenName]){
		NSLog(@"Maiden Name not input!!!!");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Maiden Name Alert" 
														message:@"Maiden Name Not input!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
		
	}
	
	
	if([cName isEqualToString:defaultCityName]){
		NSLog(@"City Name not input!!!!");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"City Name Alert" 
														message:@"City Name Not input!!!"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil
							  ];
		[alert show];    
		[alert release];
		
	}	
	
	
	
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
		firstName.text = [self defaultFirstName];
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
	[self setDefaultFirstName:firstName.text];
	[self setDefaultLastName:lastName.text];
	[self setDefaultMaidenName:maidenName.text];
	[self setDefaultCityName:city.text];
	
	NSLog(@"setting defaultFirstName:%@",[self defaultFirstName]);
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
