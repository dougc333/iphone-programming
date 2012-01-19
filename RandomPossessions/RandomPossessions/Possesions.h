//
//  Possesions.h
//  RandomPossessions
//
//  Created by d c on 12/2/11.
//  Copyright 2011 stanford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possesions : NSObject
{
    NSString *possessionName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
    
}

- (void)setPossessionName:(NSString *)str;
- (NSString *) possessionName;
- (void) setSerialNumber:(NSString *)str;
- (NSString *) serialNumber;
- (void) setValueInDollars:(int)i;
- (int) valueInDollars;
- (NSDate *) dateCreated;
@end
