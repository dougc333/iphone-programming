//
//  PickerTestAppDelegate.m
//  PickerTest
//
//  Created by doug chang on 9/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PickerTestAppDelegate.h"
//PickerViewDelegate says you need to support
//1) pickerView:rowHeightForComponent
//CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//2) pickerView:widthForComponent
//- (CGFloat)pickerView:(UIPickerView *)pickerView  widthForComponent:(NSInteger)component
//3) either pickerView:titleForRow:forComponent: or the pickerView:viewForRow:forComponent:reusingView method
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//4) pickerView:didSelectRow:inComponent

@implementation PickerTestAppDelegate

@synthesize window,picker,pickerData;

(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
	
}

#pragma mark Picker DataSource/Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *optionForRow = [pickerData objectAtIndex:row];	
    return optionForRow;
	
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {	
    NSString* optionForRow = [pickerData objectAtIndex:row];
	//WHAT THE HELL DOES THIS DO????
//    [setupInfo setObject:[optionForRow objectForKey:kAccuracyValueKey] forKey:kSetupInfoKeyAccuracy];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
	return [pickerData count];
}

-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component{
	return [pickerData objectAtIndex:row];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Override point for customization after application launch@"a"
    NSArray *array = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",nil];
	self.pickerData = array;
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
