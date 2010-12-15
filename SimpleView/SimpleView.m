//
//  SimpleView.m
//  SimpleView
//
//  Created by doug chang on 9/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleView.h"


@implementation SimpleView
/**
- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code here.
	CGRect myRect = CGRectMake(50, 50, 100, 200);
	[[UIColor redColor] setFill];
	UIRectFill(myRect);

	CGRect myOtherRect = CGRectMake(100, 210, 150, 50);
	[[UIColor blueColor] setStroke];
	//this may be a mistake, should be UIRectFill? 
	UIRectFrame(myOtherRect);
	
}

@end
