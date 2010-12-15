//
//  ImageCache.h
//  Homepwner
//
//  Created by doug chang on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageCache : NSObject {
	NSMutableDictionary *dictionary;
}

+(ImageCache *)sharedImageCache;
-(void)setImage:(UIImage *)i forKey:(NSString*)s;
-(UIImage*)imageForKey:(NSString *)s;
-(void)deleteImageForKey:(NSString*)s;

@end
