//
//  Line.h
//  Sketch
//
//  Created by doug chang on 12/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Line : NSObject {
	CGPoint start;
	CGPoint end;
}

@property (nonatomic, assign) CGPoint start;
@property (nonatomic, assign) CGPoint end;

@end
