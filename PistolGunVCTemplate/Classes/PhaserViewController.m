//
//  PhaserViewController.m
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/17/10.
//  Copyright 2010 edu.canadacollege. All rights reserved.
//

#import "PhaserViewController.h"


@implementation PhaserViewController
@synthesize phaserView, index;


-(id)init
{
	NSLog(@"PhaserViewController init");
	if(self = [super init]){
		//init here
		UITabBarItem *tabBarItem = [self tabBarItem]; //singleton?
		[tabBarItem setTitle:@"Phaser"];
	}	
	return self;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/**
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	NSLog(@"phaserViewController initWithNibName");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return [self init];
}
*/


- (void)loadView {
	NSLog(@"PhaserViewController loadView");
	//how do you get the geometry from the system? 
	CGRect area = CGRectMake(0, 150, 330, 200);
	
	PhaserView *pv = [[PhaserView alloc]initWithFrame:area];
	//debug make pv white
	[pv setBackgroundColor:[UIColor clearColor]];
	
	UIImage *image = [UIImage imageNamed:@"phaser.jpg"];
	UIImageView *gunImage = [[UIImageView alloc] initWithImage:image];
	[gunImage setFrame:area];
	[pv addSubview:gunImage];
	//this isnt clean, you have 2 views here. 
	[self setView:pv];
	self.phaserView = pv;
	//[pv fireGun];
	//[self.phaserView fireGun]; this works also
	//[[self View] fireGun]; this doesnt work, unrecognized selector
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"PhaserViewController viewDidLoad");
    [super viewDidLoad];
	//[self.phaserView fireGun]; this works
}

-(void) viewWillAppear:(BOOL)animated
{
	NSLog(@"PhaserViewController viewWillAppear");
	[self createTransferFunction];
	NSLog(@"viewWillAppear %d",sizeof(xSample));
	[self reset];
	for (int i=0; i<sizeof(xSample); i++) {
		NSLog(@"PhaserViewController memset xSample:%f",xSample[i]);
	}
	[super viewWillAppear:animated];
	//NSLog(@"PhaserViewController accelerometer");
	//UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
	//[a setUpdateInterval:.2];
	//[a setDelegate:self];	
	
	
}



-(void) viewWillDisappear:(BOOL)animated
{
	NSLog(@"phaserViewController viewWillDisappesr");
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
	xSample[index] = x;
	self.index++;
	//	NSLog(@"index:%d",index);
	if (index==9) {
		index=0;
	}
	if (sum>1.7) {
		[self reset];
		NSLog(@"Phaser View Controller DETECTED FIRE!!!!!!!!!!!!!++++++++++++++++");
		[self.phaserView fireGun];
//		[self.pistolView fireGun];
	}
	
}

-(void) reset
{
	memset(xSample,0.0,sizeof(xSample));
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
