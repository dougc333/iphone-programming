//
//  PistolGunVCTemplateViewController.h
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PistolGunVCTemplateViewController : UIViewController <UIAccelerometerDelegate>{
	double xSample[10];
	double h[10];
	NSArray *accelSamples;
	int index;
}

@property (assign) int index; 
//@property (assign) double xSample;

-(double) computeConvolution;
-(void) createTransferFunction;
-(void) reset;
@end

