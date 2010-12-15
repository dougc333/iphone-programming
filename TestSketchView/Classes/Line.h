//
//  Line.h
//  TestSketchView
//
//  Created by doug chang on 12/5/10.
//  Copyright 2010 edu.canadacollege. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Line : NSObject {
	CGPoint startLine;
	CGPoint endLine;
}

@property (nonatomic, assign) CGPoint startLine;
@property (nonatomic, assign) CGPoint endLine;

@end
