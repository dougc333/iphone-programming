//
//  Possessions.m
//  RandomPossesions
//
//  Created by doug chang on 8/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Possessions.h"


@implementation Possessions
@synthesize possessionName, serialNumber,valueInDollars,dateCreated, imageKey;

-(id)init{
	return [self initWithPossessionName:@"Possession" valueInDollars:0 serialNumber:@""];
}

-(void)encodeWithCoder:(NSCoder *)encoder{
	[encoder encodeObject:possessionName forKey:@"possessionName"];
	[encoder encodeObject:serialNumber forKey:@"serialNumber"];
	[encoder encodeInt:valueInDollars forKey:@"valueInDollars"];
	[encoder encodeObject:dateCreated forKey:@"dateCreated"];
	[encoder encodeObject:imageKey forKey:@"imageKey"];
	
}

-(id)initWithCoder:(NSCoder *)decoder{
	[super init];
	[self setPossessionName:[decoder decodeObjectForKey:@"possessionName"]];
	[self setSerialNumber:[decoder decodeObjectForKey:@"serialNumber"]];
	[self setValueInDollars:[decoder decodeIntForKey:@"valueInDollars"]];
	[self setImageKey:[decoder decodeObjectForKey:@"imageKey"]];
	dateCreated = [[decoder decodeObjectForKey:@"dateCreated"]retain];
	return self; 
	 
}
-(id)initWithPossessionName:(NSString *)pName{
	return [self initWithPossessionName:pName valueInDollars:0 serialNumber:@""];
	
}

-(id)initWithPossessionName:(NSString *)pName valueInDollars:(int)value serialNumber:(NSString *)sNumber{
	[super init];
	if(!self){
		NSLog(@"super init failed in initWithPossessionName");
		return nil;
	}
	
	[self setValueInDollars:value];
	[self setSerialNumber:sNumber];
	[self setPossessionName:pName];
	dateCreated = [[NSDate	alloc]init];
	
	return self;	
}


+(id)RandomPossession{
	static NSString *randomAdjectiveList[3] = {@"Fluffy", @"Rusty",@"Shiny"}; 
	static NSString *randomNounList[3] = {@"Bear", @"Spork",@"Mac"}; 
	NSString * randomName= [NSString stringWithFormat:@"%@ %@",randomAdjectiveList[random() % 3],randomNounList[random() % 3] ];
	int randomValue = random() % 100;
	NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",'0'+random() % 10,
									'A'+random() % 26,'0'+random() % 10,'A'+random() % 26,'0'+random() % 10];
	Possessions *newPoss = [[self alloc] initWithPossessionName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
	return [newPoss autorelease];
	
}


-(NSString *) description{
	NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@", possessionName, serialNumber, valueInDollars, dateCreated];
	return [descriptionString autorelease];
}

-(void) dealloc{
	[possessionName release];
	[serialNumber release];
	[dateCreated release];
	[imageKey release];
	[super	dealloc];
}
@end
