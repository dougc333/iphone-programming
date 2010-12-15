//
//  SketchView.m
//  Sketch
//
//  Created by doug chang on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "SketchView.h"

// use more fingers or more taps for screen clear, experiment. 
// circle is cool, how do you set the center? the radius you use the pinch.
// 

@implementation SketchView
@synthesize begin;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		circleArr = [[NSMutableArray alloc] init];
		linesInProcess = [[NSMutableDictionary alloc] init];
		completeLines = [[NSMutableArray alloc] init];
		self.multipleTouchEnabled = YES;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSLog(@"draw rect numObjects in array:%d",[circleArr count]);
	
	CGContextRef myContext = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(myContext, 4.0);
	//draw the circles 
	[[UIColor redColor] set];
	for (Circle *c in circleArr) {
		NSLog(@"circle firstTouch x:%f y;%f",c.firstTouch.x, c.firstTouch.y);
		NSLog(@"circle secondTouch x:%f y;%f",c.secondTouch.x, c.secondTouch.y);
		CGPoint center;
		center.x = c.firstTouch.x + (c.secondTouch.x - c.firstTouch.x)/2.0;
		center.y = c.firstTouch.y + (c.secondTouch.y - c.firstTouch.y)/2.0;
		float diam = hypot((c.secondTouch.x-c.firstTouch.x), (c.secondTouch.y - c.firstTouch.y));		
		CGContextAddArc(myContext, center.x, center.y, diam/2.0, 0.0, M_PI*2.0, YES);
		CGContextStrokePath(myContext);
	}
	
	//draw more lines
	[[UIColor greenColor] set];
    for (Line *line in completeLines) {
        CGContextMoveToPoint(myContext, [line start].x, [line start].y);
        CGContextAddLineToPoint(myContext, [line end].x, [line end].y);
        CGContextStrokePath(myContext);
    }
	
	[[UIColor yellowColor] set];
    for (NSValue *v in linesInProcess) {
        Line *line = [linesInProcess objectForKey:v];
        CGContextMoveToPoint(myContext, [line start].x, [line start].y);
        CGContextAddLineToPoint(myContext, [line end].x, [line end].y);
        CGContextStrokePath(myContext);
    }
	
	
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"touchesBegan num in touch array:%d",[touches count]);
	UITouch *firstTouch;
	UITouch *secondTouch;
	
	if ([touches count]==2) {
		firstTouch = [[touches allObjects] objectAtIndex:0];
		secondTouch = [[touches allObjects] objectAtIndex:1];
		Circle *c = [[Circle alloc]init];
		c.firstTouch = [firstTouch locationInView:self];
		c.secondTouch = [secondTouch locationInView:self];
		[circleArr addObject:c];
		[self setNeedsDisplay];
		
	}else if ([touches count]==1) {
		firstTouch = [[touches allObjects] objectAtIndex:0];
		NSLog(@"touchsBegan firstTouch only tapCount:%d",[firstTouch tapCount]);
		/**
		NSValue *key = [NSValue valueWithPointer:firstTouch];
		CGPoint loc = [firstTouch locationInView:self];
		NSLog(@"touchesBegan CGPoint loc x:%f y:%f", loc.x, loc.y);
		Line *newLine = [[Line alloc] init];
		[newLine setStart:loc];
		//why do we set end? TO get a point. 
		[newLine setEnd:loc];
		NSLog(@"touchesBegan newLine setting newLine Start to: x:%f  y:%f", [newLine start].x , [newLine start].y );
		[linesInProcess setObject:newLine forKey:key];
		NSLog(@"touchesBegan adding newLine to linesInProcess");
		//[newLine release];
		 */
		
	}
	//if ([firstTouch tapCount] > 1) {
	//	NSLog(@"tapcount>1 calling clearAll");
		//[self clearAll];
	//	return;
	//}
		
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesMoved touches moved num Touches:%d",[touches count]);
	//for (UITouch *t in touches) {
	UITouch *t = [touches anyObject];
	
		NSLog(@"touchesMoved: x:%d y:%d", [t locationInView:self].x, [t locationInView:self].y);
		NSValue *key = [NSValue valueWithPointer:t];
		Line *line = [linesInProcess objectForKey:key];
		NSLog(@"touchesMoved dict lookup line begin x:%d begin y:%d", [line start].x, [line start].y);
	//CGPoint end = [t locationInView:self];
	//Line *newLine = [[Line alloc]init];
	//newLine.start = self.begin;
	//newLine.end = end;
	//self.begin = end;
	//NSLog(@"adding new line before add:%d",[lineArray count]);
		CGPoint loc = [t locationInView:self];
		[line setEnd:loc];
		NSLog(@" end of line: x:%f y:%f",loc.x, loc.y);
	//}
	[self setNeedsDisplay];
}

- (void)endTouches:(NSSet *)touches
{
	NSLog(@"endTouches numTouches:",[touches count]);
    // Remove ending touches from dictionary
    //for (UITouch *t in touches) {
		UITouch *t = [touches anyObject];
	NSLog(@"endTouches numTouches:%d",[touches count]);
		NSLog(@"touch coordinate: x:%f y:%f",[t locationInView:self].x,[t locationInView:self].y);
        NSValue *key = [NSValue valueWithPointer:t];
        Line *line = [linesInProcess objectForKey:key];
		NSLog(@"endTouches dict lookup line begin x:%f begin y:%f", [line start].x, [line start].y);
		
        // If this is a double tap, 'line' will be nil
  //      if (line) {
  //          [completeLines addObject:line];
  //          [linesInProcess removeObjectForKey:key];
   //     }
    //}
    // Redraw
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
	NSLog(@"touchesEnded");
    [self endTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
	NSLog(@"endCancelled");
    [self endTouches:touches];
}



-(id)initWithCoder:(NSCoder *)aDecoder{
	if((self = [super initWithCoder:aDecoder])){
		circleArr = [[NSMutableArray alloc] init];
		self.multipleTouchEnabled = YES;
	}
	return self;
}

-(void)clearAll{
	NSLog(@"clearAll");
//	[arr removeAllObjects];
//	[self setNeedsDisplay];
}

- (void)dealloc {
	[linesInProcess release];
	[completeLines release];
	[circleArr dealloc];
    [super dealloc];
}


@end
