//
//  PhaserViewController.h
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/17/10.
//  Copyright 2010 edu.canadacollege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhaserView.h"
//<UIAccelerometerDelegate>
@interface PhaserViewController : UIViewController {
	double xSample[10];
	double h[10];
	NSArray *accelSamples;
	int index;
	//PhaserView *view;
	PhaserView *phaserView;
}

@property (assign) int index; 
//@property (nonatomic, retain) PistolView *view;
//@property (assign) double xSample;
@property (nonatomic, retain) PhaserView *phaserView;

-(double) computeConvolution;
-(void) createTransferFunction;
-(void) reset;


@end
