#import <Foundation/Foundation.h>
#import "Possessions.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSMutableArray *items = [[NSMutableArray alloc]init];

	for (int i=0;i<10;i++){
		[items addObject:[Possessions RandomPossession]];
	}
	
	for(int i=0;i<[items count];i++){
		NSLog(@"item:%@",[items objectAtIndex:i]);
	}
	[items release];
	items=nil;
	
    [pool drain];
    return 0;
}
