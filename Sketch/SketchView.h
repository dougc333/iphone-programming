//
//  SketchView.h
//  Sketch
//
//  Created by doug chang on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circle.h"
#import "Line.h"

@interface SketchView : UIView {
	NSMutableArray * circleArr;
	NSMutableDictionary *linesInProcess;
	NSMutableArray *completeLines;
	CGPoint begin;
}

@property (nonatomic, assign) CGPoint begin;

-(void)clearAll;
@end
