//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by doug chang on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possessions.h"


@implementation ItemDetailViewController
@synthesize editingPossession;

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    [nameField setText:[editingPossession possessionName]];
    [serialNumberField setText:[editingPossession serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d",
						 [editingPossession valueInDollars]]];
	
    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]
									  autorelease];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	
    // Use filtered NSDate object to set dateLabel contents
    [dateLabel setText:
	 [dateFormatter stringFromDate:[editingPossession dateCreated]]];
	
    // Change the navigation item to display name of possession
    [[self navigationItem] setTitle:[editingPossession possessionName]];
}

-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[nameField resignFirstResponder];
	[serialNumberField resignFirstResponder];
	[valueField resignFirstResponder];
	
	//saves changes to Possession
	[editingPossession setPossessionName:[nameField text]];
	[editingPossession setSerialNumber:[serialNumberField text]];
	[editingPossession setValueInDollars:[[valueField text]intValue]];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];	
}

- (void)viewDidUnload {
	[super viewDidUnload];
	[nameField release];
    nameField = nil;
	
    [serialNumberField release];
    serialNumberField = nil;
	
    [valueField release];
    valueField = nil;
	
    [dateLabel release];
    dateLabel = nil;
	
}


- (void)dealloc {
	[nameField release];
    [super dealloc];
}


@end
