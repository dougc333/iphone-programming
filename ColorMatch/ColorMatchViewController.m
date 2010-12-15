//
//  ColorMatchViewController.m
//  ColorMatch
//
//  Created by doug chang on 10/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ColorMatchViewController.h"


@implementation ColorMatchViewController
@synthesize firstSlider, secondSlider,thirdSlider,randomLabel,userLabel,red,green,blue;
@synthesize randomRed,randomGreen,randomBlue;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction) sliderChanged{
	NSLog(@"slider changed:%.2f",firstSlider.value);
	red.text = [[NSString alloc] initWithFormat:@"%.2f",firstSlider.value];
	green.text = [[[NSString alloc] initWithFormat:@"%.2f",secondSlider.value]autorelease ];
	blue.text = [[[NSString alloc] initWithFormat:@"%.2f",thirdSlider.value] autorelease];

	red.backgroundColor = [UIColor colorWithRed:redValue green:0.0 blue:0.0 alpha:1.0];
	green.backgroundColor = [UIColor colorWithRed:0.0 green:greenValue blue:0.0 alpha:1.0];
	blue.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:blueValue alpha:1.0];
	userLabel.backgroundColor = [UIColor colorWithRed:firstSlider.value green:secondSlider.value blue:thirdSlider.value alpha:1.0];
	
}
-(IBAction) show{
	NSLog(@"show button being pressed");
	//alert to display values of random values;
	NSString *redString = [[NSString alloc]initWithFormat:@"%f",[self randomRed]];
	NSString *greenString = [[NSString alloc]initWithFormat:@"%f",[self randomGreen]];
	NSString *blueString = [[NSString alloc]initWithFormat:@"%f",[self randomBlue]];
	

	
	NSString *final = [[[[redString stringByAppendingFormat:@","] stringByAppendingFormat:greenString] stringByAppendingString:@","] stringByAppendingString:blueString];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RandomColorValues" 
													message:final
												   delegate:self 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil
						  ];
	[alert show];    
	[alert release];
	
	
	
}
-(IBAction) reset{
	//reset the text values and sliders to 0. 
	[self updateRandomLabel];
}

-(void) updateRandomLabel{
	NSLog(@"random label button");
	srand((unsigned)time(0));
	self.randomRed = random()/(0x7FFFFFFF-1.0);	
	self.randomGreen = random()/(0x7FFFFFFF-1.0);
	self.randomBlue = random()/(0x7FFFFFFF-1.0);
	NSLog(@"random int between 0-1:%f",randomRed);
	NSLog(@"random int between 0-1:%f",randomGreen);
	NSLog(@"random int between 0-1:%f",randomBlue);
	
	randomLabel.backgroundColor = [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1.0];
}




- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self setFirstSlider:nil];
	[self setSecondSlider:nil];
	[self setThirdSlider:nil];
	self.randomLabel = nil;
	self.userLabel = nil;
    [super dealloc];
}


@end
