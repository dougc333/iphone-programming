//
//  Circle.h
//  Sketch
//
//  Created by doug chang on 10/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Circle : NSObject {
	CGPoint firstTouch;
	CGPoint secondTouch;
}

@property (assign,nonatomic) CGPoint firstTouch;
@property (assign,nonatomic) CGPoint secondTouch;


@end
