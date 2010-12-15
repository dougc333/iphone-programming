//
//  ItemsViewController.m
//  Homepwner
//
//  Created by doug chang on 10/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "Possessions.h"
#import "ItemDetailViewController.h"

//this is the root view controller, the screen the user sees first
@implementation ItemsViewController
@synthesize possessions;

-(id)init{
	[super initWithStyle:UITableViewStyleGrouped];
	possessions = [[NSMutableArray alloc] init];
//	for (int i=0; i<10; i++) {
//		[possessions addObject:[Possessions RandomPossession]];
//	}
	//NSLog(@"possessions count:5d",[possessions count]);
	[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
	[[self navigationItem] setTitle:@"Homepwner"];

	return self;	
}

-(id) initWithStyle:(UITableViewStyle)style{
	return [self init];
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
	//return [possessions count];
	int numberOfRows = [possessions count];
	if ([self isEditing]) {
		numberOfRows++;
	}
	return numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath{
	
	//UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"]autorelease];
	//Possessions *p = [possessions objectAtIndex:[indexPath row]];
	//[[cell textLabel] setText:[p description]];
	//return cell;
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"]autorelease]; 
	}
	if ([indexPath row] < [possessions count]) {
		Possessions *p = [possessions objectAtIndex:[indexPath row]];
		[[cell textLabel] setText:[p description]];
	}else{
		[[cell textLabel] setText:@"Add new item"];
	}
	return cell;

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isEditing] && [indexPath row] == [possessions count]) {
		
        // The last row during editing will show an insert style button
        return UITableViewCellEditingStyleInsert;
    }
    // All other rows remain deleteable
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
        // We remove the row being deleted from the possessions array
        [possessions removeObjectAtIndex:[indexPath row]];
		
        // We also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }else if (editingStyle == UITableViewCellEditingStyleInsert) {
		
        // If the editing style of the row was insertion,
        // we add a new possession object and new row to the table view
        [possessions addObject:[Possessions RandomPossession]];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:UITableViewRowAnimationLeft];
    }

}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    // Always call super implementation of this method, it needs to do work
    [super setEditing:flag animated:animated];
	
    // You need to insert/remove a new row in to table view
    if (flag) {
        // If entering edit mode, we add another row to our table view
        NSIndexPath *indexPath =
		[NSIndexPath indexPathForRow:[possessions count] inSection:0];
        NSArray *paths = [NSArray arrayWithObject:indexPath];
		
        [[self tableView] insertRowsAtIndexPaths:paths
                                withRowAnimation:UITableViewRowAnimationLeft];
    } else {
        // If leaving edit mode, we remove last row from table view
        NSIndexPath *indexPath =
		[NSIndexPath indexPathForRow:[possessions count] inSection:0];
        NSArray *paths = [NSArray arrayWithObject:indexPath];
		
        [[self tableView] deleteRowsAtIndexPaths:paths
                                withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Only allow rows showing possessions to move
    if ([indexPath row] < [possessions count])
        return YES;
    return NO;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
	   toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if ([proposedDestinationIndexPath row] < [possessions count]) {
        // If we are moving to a row that currently is showing a possession,
        // then we return the row the user wanted to move to
        return proposedDestinationIndexPath;
    }
    // We get here if we are trying to move a row to under the "Add New Item..."
    // row, have the moving row go one row above it instead.
    NSIndexPath *betterIndexPath =
	[NSIndexPath indexPathForRow:[possessions count] - 1 inSection:0];
	
    return betterIndexPath;
}


- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath
{
    // Get pointer to object being moved
    Possessions *p = [possessions objectAtIndex:[fromIndexPath row]];
	
    // Retain p so that it is not deallocated when it is removed from the array
    [p retain];
	// Retain count of p is now 2
	
    // Remove p from our array, it is automatically sent release
    [possessions removeObjectAtIndex:[fromIndexPath row]];
	// Retain count of p is now 1
	
    // Re-insert p into array at new location, it is automatically retained
    [possessions insertObject:p atIndex:[toIndexPath row]];
	// Retain count of p is now 2
	
    // Release p
    [p release];
	// Retain count of p is now 1
}



- (void)tableView:(UITableView *)aTableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!detailViewController) {
        detailViewController = [[ItemDetailViewController alloc] init];
    }
	
	[detailViewController setEditingPossession:[possessions objectAtIndex:[indexPath row]]];

    // Push it onto the top of the navigation controller's stack
    [[self navigationController] pushViewController:detailViewController
                                           animated:YES];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
