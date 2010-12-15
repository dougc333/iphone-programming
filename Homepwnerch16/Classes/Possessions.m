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
	[encoder encodeObject:thumbnailData forKey:@"thumbnailData"];
	
}

-(id)initWithCoder:(NSCoder *)decoder{
	[super init];
	[self setPossessionName:[decoder decodeObjectForKey:@"possessionName"]];
	[self setSerialNumber:[decoder decodeObjectForKey:@"serialNumber"]];
	[self setValueInDollars:[decoder decodeIntForKey:@"valueInDollars"]];
	[self setImageKey:[decoder decodeObjectForKey:@"imageKey"]];
	dateCreated = [[decoder decodeObjectForKey:@"dateCreated"]retain];
	thumbnailData = [[decoder decodeObjectForKey:@"thumbnailData"] retain];

	return self; 
	 
}
- (UIImage *)thumbnail
{
    // Am I imageless?
    if (!thumbnailData) {
        return nil;
    }    // Is there no cached thumbnail image?
    if (!thumbnail) {
        // Create the image from the data
        thumbnail = [[UIImage imageWithData:thumbnailData] retain];
    }
    return thumbnail;
	
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

- (void)setThumbnailDataFromImage:(UIImage *)image
{
    // Release the old thumbnail data
    [thumbnailData release];
	
    // Release the old thumbnail
    [thumbnail release];
	
    // Create an empty image of size 70 × 70
    CGRect imageRect = CGRectMake(0, 0, 70, 70);
    UIGraphicsBeginImageContext(imageRect.size);
	
    // Render the big image onto the image context
    [image drawInRect:imageRect];
	
    // Make a new one from the image context
    thumbnail = UIGraphicsGetImageFromCurrentImageContext();
	
    // Retain the new one
    [thumbnail retain];
	
    // Clean up image context resources
    UIGraphicsEndImageContext();    // Make a new data object from the image
    thumbnailData = UIImageJPEGRepresentation(thumbnail, 0.5);
    // You may get malloc warnings from the simulator on this line
    // That is a bug in the simulator.
	
    // Retain it
    [thumbnailData retain];
}



-(NSString *) description{
	NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@", possessionName, serialNumber, valueInDollars, dateCreated];
	return [descriptionString autorelease];
}

-(void) dealloc{
	[thumbnail release];
    [thumbnailData release];
	[possessionName release];
	[serialNumber release];
	[dateCreated release];
	[imageKey release];
	[super	dealloc];
}
@end
