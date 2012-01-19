//
//  main.m
//  RandomPossessions
//
//  Created by d c on 11/30/11.
//  Copyright 2011 stanford. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
    NSMutableArray *items = [[NSMutableArray alloc]init];
    //add from input
    [items addObject:@"one"];
    [items addObject:@"two"];
    [items addObject:@"three"];
    [items addObject:@"buckle my shoe"];
    
    
    for(int i=0;i<[items count];i++){
        NSLog(@"items in array: %d are: %@",i,[items objectAtIndex:i]);
    }
    
    [items release];
    items=nil; //what is difference between null and nil? nil points to nothing null can be something. 
    
    [pool drain];
    return 0;
}

