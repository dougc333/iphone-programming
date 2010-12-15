//
//  HypnosisView.m
//  Hypnosister
//
//  Created by doug chang on 9/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView

/**
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}
 */


- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGRect bounds = [self bounds];
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width/2.0;
	center.y = bounds.origin.y + bounds.size.height/2.0;
	NSLog(@"center.x:%f center.y:%f",center.x, center.y);
	NSLog(@"bounds width:%f bounds.height:%f",bounds.size.width, bounds.size.height);
	
	float maxRadius = hypot(bounds.size.width, bounds.size.height);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 10);
	[[UIColor lightGrayColor] setStroke];
	for (float currentRadius=maxRadius; currentRadius>0; currentRadius-=20) {
		CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI*2.0, YES);
		CGContextStrokePath(context);
	}
	NSString *text = @"You are getting sleepy...";
	UIFont *font = [UIFont boldSystemFontOfSize:28];
	CGRect textRect;
	textRect.size = [text sizeWithFont:font];
	textRect.origin.x = center.x - textRect.size.width/2.0;
	textRect.origin.y = center.y - textRect.size.height/2.0;
	[[UIColor blackColor] setFill];
	
	CGSize offset = CGSizeMake(4, -3);
	CGColorRef color = [[UIColor darkGrayColor] CGColor];
	CGContextSetShadowWithColor(context, offset, 2.0, color);
	[text drawInRect:textRect withFont:font];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
