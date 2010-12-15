//
//  PistolGunVCTemplateViewController.m
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PistolGunVCTemplateViewController.h"

@implementation PistolGunVCTemplateViewController
@synthesize index;


/**
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		// we dont need this data structure
//		accelSamples = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0],
//						[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0],
//						[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.0], nil];
		
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (void)viewWillAppear:(BOOL)animated {
	//careful, this is by byte. 
	//int index = 0;
	//double xSample[10];
	[self createTransferFunction];
	NSLog(@"viewWillAppear %d",sizeof(xSample));
	//memset(xSample,0.0,sizeof(xSample));
	[self reset];
	for (int i=0; i<sizeof(xSample); i++) {
		NSLog(@"memset xSample:%f",xSample[i]);
	}
	[super viewWillAppear:animated];
	NSLog(@"accelerometer");
	UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
	[a setUpdateInterval:.2];
	[a setDelegate:self];
}


-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];	
}

-(void) createTransferFunction
{
	h[0]=2.0;
	h[1]=2.0;
	h[2]=2.0;
	h[3]=2.0;
	h[4]=2.0;
	h[5]=2.0;
	h[6]=2.0;
	h[7]=2.0;
	h[8]=2.0;
	h[9]=2.0;
}

-(double) computeConvolution
{
	//multiply by constant transfer function first
	/**
	NSLog(@"h[0]: %f xSample[0]:%f ",h[0],xSample[0]);
	NSLog(@"h[1]: %f xSample[1]:%f",h[1],xSample[1]);
	NSLog(@"h[2]: %f xSample[2]:%f",h[2],xSample[2]);
	NSLog(@"h[3]: %f xSample[3]:%f",h[3],xSample[3]);
	NSLog(@"h[4]: %f xSample[4]:%f",h[4],xSample[4]);
	NSLog(@"h[5]: %f xSample[5]:%f",h[5],xSample[5]);
	NSLog(@"h[6]: %f xSample[6]:%f",h[6],xSample[6]);
	NSLog(@"h[7]: %f xSample[7]:%f",h[7],xSample[7]);
	NSLog(@"h[8]: %f xSample[8]:%f",h[8],xSample[8]);
	NSLog(@"h[9]: %f xSample[9]:%f",h[9],xSample[9]);
*/
	double sum = h[0]*xSample[0]+h[1]*xSample[1]+h[2]*xSample[2]+h[3]*xSample[3]+h[4]*xSample[4]+
	h[5]*xSample[5]+h[6]*xSample[6]+h[7]*xSample[7]+h[8]*xSample[8]+h[9]*xSample[9];
	NSLog(@"sum:%f",sum);
	return sum;
}

-(void) accelerometer:(UIAccelerometer *) meter didAccelerate:(UIAcceleration *)accel
{
	double x,y,z;
	x = [accel x];
	y = [accel y];
	z = [accel z];
	//HypnosisView *hv = (HypnosisView *)[self view];
	//[hv setXShift:10.0 * [accel x]];
	//[hv setNeedsDisplay];
	if([accel x] < 0){
		x = 0;
	}
	float sum = [self computeConvolution];
	//NSLog(@"%f %f %f %f", x , y, z,sum );
	//store last 10 into array. 
	//what is the current index? Like a vector, you want to always add to the end and have the first one 
	//pushed out.
	//if this is multithreaded we are screwed
	xSample[index] = x;
	self.index++;
//	NSLog(@"index:%d",index);
	if (index==9) {
		index=0;
	}
	if (sum>1.7) {
		[self reset];
		NSLog(@"DETECTED FIRE!!!!!!!!!!!!!++++++++++++++++");
	}
	
}

-(void) reset
{
	memset(xSample,0.0,sizeof(xSample));
}


/* does the acceleration work the same when rotated? probably not, the definition of
 // the x, y, z axis changes. 
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
    [super dealloc];
}

@end
