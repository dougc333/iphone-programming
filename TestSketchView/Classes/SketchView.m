//
//  SketchView.m
//  TestSketchView
//
//  Created by doug chang on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SketchView.h"


@implementation SketchView
@synthesize touchStart;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

}




- (void)dealloc {
    [super dealloc];
}


@end
