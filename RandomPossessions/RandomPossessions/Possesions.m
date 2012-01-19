//
//  Possesions.m
//  RandomPossessions
//
//  Created by d c on 12/2/11.
//  Copyright 2011 stanford. All rights reserved.
//

#import "Possesions.h"

@implementation Possesions

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}



- (void)setPossessionName:(NSString *)str
{
    possessionName = str;
}
- (NSString *) possessionName
{
    return possessionName;
}
- (void) setSerialNumber:(NSString *)str
{   
    serialNumber = str;
}
- (NSString *) serialNumber
{
    return serialNumber;
}
- (void) setValueInDollars:(int)i
{
    valueInDollars = i;
}
- (int) valueInDollars
{
    return valueInDollars;
}
- (NSDate *) dateCreated
{
    return dateCreated;
}

@end
