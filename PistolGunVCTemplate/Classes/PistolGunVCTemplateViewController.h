//
//  PistolGunVCTemplateViewController.h
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PistolView.h"

@interface PistolGunVCTemplateViewController : UIViewController <UIAccelerometerDelegate>{
	double xSample[10];
	double h[10];
	NSArray *accelSamples;
	int index;
	PistolView *view;
	PistolView *pistolView;
}

@property (assign) int index; 
//@property (nonatomic, retain) PistolView *view;
//@property (assign) double xSample;
@property (nonatomic, retain) PistolView *pistolView;

-(double) computeConvolution;
-(void) createTransferFunction;
-(void) reset;

@end

