//
//  SketchView.h
//  TestSketchView
//
//  Created by doug chang on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface SketchView : UIView {
	CGPoint touchStart;
	NSMutableArray *lineArr;
}

@property (nonatomic, assign) CGPoint touchStart;


@end
