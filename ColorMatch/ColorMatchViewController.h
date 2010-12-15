//
//  ColorMatchViewController.h
//  ColorMatch
//
//  Created by doug chang on 10/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ColorMatchViewController : UIViewController {
	UISlider *firstSlider;
	UISlider *secondSlider;
	UISlider *thirdSlider;
	UILabel *randomLabel;
	UILabel *userLabel;
	UILabel *red;
	UILabel *green;
	UILabel *blue;
	float redValue;
	float greenValue;
	float blueValue;
	float randomRed;
	float randomGreen;
	float randomBlue;
	
}

@property (nonatomic, retain) IBOutlet UISlider *firstSlider;
@property (nonatomic, retain) IBOutlet UISlider *secondSlider;
@property (nonatomic, retain) IBOutlet UISlider *thirdSlider;
@property (nonatomic, retain) IBOutlet UILabel *randomLabel;
@property (nonatomic, retain) IBOutlet UILabel *userLabel;
@property (nonatomic, retain) IBOutlet UILabel *red;
@property (nonatomic, retain) IBOutlet UILabel *green;
@property (nonatomic, retain) IBOutlet UILabel *blue;
@property (assign) float randomRed;
@property (assign) float randomGreen;
@property (assign) float randomBlue;


-(IBAction) sliderChanged;
-(IBAction) show;
-(IBAction) reset;

-(void) updateRandomLabel;


@end
