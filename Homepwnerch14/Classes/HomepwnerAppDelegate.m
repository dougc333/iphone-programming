//
//  HomepwnerAppDelegate.m
//  Homepwner
//
//  Created by doug chang on 10/9/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HomepwnerAppDelegate.h"


@implementation HomepwnerAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	NSString *possessionPath = [self possessionArrayPath];
	NSMutableArray *possessionArray = 
	[NSKeyedUnarchiver unarchiveObjectWithFile:possessionPath];
	if (!possessionArray) {
		possessionArray = [NSMutableArray array];
	}
	itemsViewController = [[ItemsViewController alloc]init];
	[itemsViewController setPossessions:possessionArray];
	UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:itemsViewController];
	[window addSubview:[navController view]];
	[window makeKeyAndVisible];
	//return YES;
	
	
	//itemsViewController = [[ItemsViewController alloc]init];
	//UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:itemsViewController];
	//[window addSubview:[navController view]];
    // Override point for customization after application launch
    //[window makeKeyAndVisible];
}

-(NSString*) possessionArrayPath{
	return pathInDocumentDirectory(@"Possessions.data");
}

-(void)applicationWillTerminate:(UIApplication *)application{
	NSString *possessionPath = [self possessionArrayPath];
	NSMutableArray *possessionArray = [itemsViewController possessions];
	[NSKeyedArchiver archiveRootObject:possessionArray toFile:possessionPath];
	
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
