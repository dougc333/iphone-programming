//
//  PistolGunVCTemplateViewController.m
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PistolGunVCTemplateViewController.h"

@implementation PistolGunVCTemplateViewController
@synthesize index, pistolView;



-(id)init
{
	NSLog(@"PistolGunVCTemplateViewController init");
	if(self = [super initWithNibName:nil bundle:nil]){
		UITabBarItem *tabBarItem = [self tabBarItem];
		[tabBarItem setTitle:@"PistolGun"];
	}	
	return self;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	CGRect area = CGRectMake(0, 150, 330, 200);
	PistolView *pv = [[PistolView alloc]initWithFrame:area];
	[pv setBackgroundColor:[UIColor clearColor]];
	
	UIImage *image = [UIImage imageNamed:@"gun.jpg"];
	UIImageView *gunImage = [[UIImageView alloc] initWithImage:image];
	[gunImage setFrame:area];
	[pv addSubview:gunImage];
	//this isnt clean, you have 2 views here. 
	[self setView:pv];
	self.pistolView = pv;

	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"PistolGunVCTemplateViewController view did load");
	//[self.pistolView fireGun];
	
}


- (void)viewWillAppear:(BOOL)animated {
	[self createTransferFunction];
	NSLog(@"viewWillAppear %d",sizeof(xSample));
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

//this is a unit impulse response
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
		[self.pistolView fireGun];
	}
	
}

-(void) reset
{
	memset(xSample,0.0,sizeof(xSample));
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
    [super dealloc];
}

@end
