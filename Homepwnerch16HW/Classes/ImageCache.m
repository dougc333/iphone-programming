//
//  ImageCache.m
//  Homepwner

//  Created by doug chang on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ImageCache.h"
static ImageCache *sharedImageCache;


@implementation ImageCache

-(id)init{
	[super init];
	dictionary = [[NSDictionary alloc]init];
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[nc addObserver:self selector:@selector name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	return self;
}

-(void) clearCache:(NSNotification*)note
{
	NSLog(@"flushing %d images out of the cache",[dictionary count]);
	[dictionary removeAllObjects];
}

+(ImageCache *)sharedImageCache{
	if (sharedImageCache) {
		sharedImageCache = [[ImageCache alloc]init];		
	}
	return sharedImageCache;
}
+(id)allocWithZone:(NSZone *)zone{
	if (!sharedImageCache) {
		sharedImageCache = [super allocWithZone:zone];
		return sharedImageCache;
	}else{
		return nil;
	}
}

-(id)copyWithZone:(NSZone*)zone{
	return self;
}

-(void)setImage:(UIImage *)i forKey:(NSString *)s{
	
	[dictionary setObject:i forKey:s];
	NSString *imagePath = pathInDocumentDirectory(s);
	NSData*d = UIImageJPEGRepresentation(i, 0.5);
	[d writeToFile:imagePath atomically:YES];
}

-(UIImage*)imageForKey:(NSString *)s{
	UIImage *result = [dictionary objectForKey:s];
	if (!result) {
		result = [UIImage imageWithContentsOfFile:pathInDocumentDirectory(s)];
		if (result) {
			[dictionary setObject:result forKey:s];
		}else{
			NSLog(@"error unable to find");
		}
	}
	return result;
}

-(void)deleteImageForKey:(NSString *)s{
	[dictionary removeObjectForKey:s];
	NSString *path = pathInDocumentDirectory(s);
	[[NSFileManager defaultManager] removeItemAtPath:path error:nil ];
}

-(void)release{
	//nop
}

@end
