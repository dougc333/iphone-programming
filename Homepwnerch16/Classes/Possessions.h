//
//  Possessions.h
//  RandomPossesions
//
//  Created by doug chang on 8/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possessions : NSObject<NSCoding> {
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
	NSString *imageKey; 
	UIImage *thumbnail;
    NSData *thumbnailData;

}
@property (nonatomic, copy) NSString *imageKey;
@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic ) int valueInDollars;
@property (nonatomic, readonly, retain ) NSDate *dateCreated;

-(id)initWithPossessionName:(NSString *)pName valueInDollars:(int)value serialNumber:(NSString *)sNumber;
-(id)initWithPossessionName:(NSString *)pName;
-(NSString *)description;
+(id)RandomPossession;

@end
