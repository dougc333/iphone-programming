//
//  NayshunzAppDelegate.m
//  Nayshunz
//
//  Created by doug chang on 11/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NayshunzAppDelegate.h"

@implementation NayshunzAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

/**
- (id)init
{
	[super init];
	
	// Create the root of the tree
	continents = [[NSMutableArray alloc] init];
	
	// Where do the documents go?
	NSArray *paths =
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
										NSUserDomainMask, YES);
	NSString *path = [paths objectAtIndex:0];
	
	// What would be the name of my database file?
	NSString *fullPath = [path stringByAppendingPathComponent:@"countries.db"];
	
	// Get a file manager for file operations
	NSFileManager *fm = [NSFileManager defaultManager];
	
	// Does the file already exist?
	BOOL exists = [fm fileExistsAtPath:fullPath];
	
	// Does it already exist?
	if (exists) {
		NSLog(@"%@ exists – just opening", fullPath);
	} else {
		NSLog(@"%@ does not exist – copying and opening", fullPath);
        // Where is the starting database in the application wrapper?
		NSString *pathForStartingDB =
		[[NSBundle mainBundle] pathForResource:@"countries"
										ofType:@"db"];
		
		// Copy it to the documents directory
		BOOL success = [fm copyItemAtPath:pathForStartingDB
								   toPath:fullPath
									error:NULL];
		if (!success) {
			NSLog(@"database copy failed");
		}
	}
	
	// Open the database file
	const char *cFullPath = [fullPath cStringUsingEncoding:NSUTF8StringEncoding];
	if (sqlite3_open(cFullPath, &database)
		!= SQLITE_OK) {
		NSLog(@"unable to open database at %@", fullPath);
	}
	
	return self;
}
*/
- (id)init 
{ 
    [super init]; 
    
    // Create the root of the tree 
    continents = [[NSMutableArray alloc] init]; 
	
	// Where do the documents go?
    NSArray *paths = 
	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
										NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
	
    
    // What would be the name of my database file? 
    NSString *fullPath = [path stringByAppendingPathComponent:@"countries.db"]; 
    
    // Get a file manager for file operations 
    NSFileManager *fm = [NSFileManager defaultManager]; 
    
    // Does the file already exist? 
    BOOL exists = [fm fileExistsAtPath:fullPath]; 
    
    // Does it already exist? 
    if (exists) { 
        NSLog(@"%@ exists -- just opening", fullPath); 
    } else { 
        NSLog(@"%@ does not exist -- copying and opening", fullPath); 
        
        // Where is the starting database in the app wrapper? 
        NSString *pathForStartingDB = [[NSBundle mainBundle] pathForResource:@"countries" 
                                                                      ofType:@"db"]; 
        
        // Copy it to the documents directory 
        BOOL success = [fm copyItemAtPath:pathForStartingDB 
                                   toPath:fullPath 
                                    error:NULL]; 
        if (!success) { 
            NSLog(@"database copy failed"); 
        } 
    } 
    
    // Open the database file
    const char *cFullPath = [fullPath cStringUsingEncoding:NSUTF8StringEncoding];
    if (sqlite3_open(cFullPath, &database) 
		!= SQLITE_OK) {
        NSLog(@"unable to open database at %@", fullPath);
    }
    return self; 
}
/**
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // Only search if the user has typed something in
    if ([searchText length] != 0) {
		
        // Does the statement need to be prepared?
        if (!statement) {
			
            // '?' is a placeholder for parameters
            char *cQuery = "SELECT Continent, Name, Code FROM Country "
			"WHERE Name LIKE ? ORDER BY Continent, Name";
			
            // Prepare the query
            if (sqlite3_prepare_v2(database, cQuery, -1, &statement, NULL)
				!= SQLITE_OK)
            {
				
                NSLog(@"query error: %s", statement);
            }
		}
		
		// Add % to the end of the search text
		searchText = [searchText stringByAppendingString:@"%"];
		
		NSLog(@"searching for %@", searchText);
		
		// This C string will get cleaned up automatically
		const char *cSearchText =
		[searchText cStringUsingEncoding:NSUTF8StringEncoding];
		
        // Replace the first (and only) parameter with the search text
        sqlite3_bind_text(statement, 1, cSearchText, -1, SQLITE_TRANSIENT);
		
        // Loop to get all the rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
			
            // Get the string in the first column
            const char *cContinentName =
			(const char *)sqlite3_column_text(statement, 0);
			
            // Convert C string into an NSString
			NSString *continentName = [[[NSString alloc]
										initWithUTF8String:cContinentName] autorelease];
            // Get the string in the second column
            const char *cCountryName =
			(const char *)sqlite3_column_text(statement, 1);
			
            // Convert C string into an NSString
            NSString *countryName = [[[NSString alloc]
									  initWithUTF8String:cCountryName] autorelease];
			
            // Get the string in the third column
            const char *cCountryCode =
			(const char *)sqlite3_column_text(statement, 2);
			
            // Convert C string into an NSString
            NSString *countryCode = [[[NSString alloc]
									  initWithUTF8String:cCountryCode] autorelease];
			
            NSLog(@"%@: %@ of %@", countryCode, countryName, continentName);
        }
        // Clear the query results
        sqlite3_reset(statement);
    }
	
    // Load the table with the new data
    [countryTable reloadData];
}
*/
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText 
{ 
    // Clear the data structures 
    [continents removeAllObjects]; 
    
    if ([searchText length] != 0) { 
        
        if (!statement) { 
            
            char *cQuery = "SELECT Continent, Name, Code FROM Country " 
			"WHERE Name LIKE ? ORDER BY Continent, Name"; 
            
            if (sqlite3_prepare_v2(database,cQuery, -1, &statement, NULL) != SQLITE_OK) { 
                NSLog(@"query error: %s", statement); 
            }            
        } 
        
        searchText = [searchText stringByAppendingString:@"%"]; 
		
        const char *cSearchText = [searchText cStringUsingEncoding:NSUTF8StringEncoding]; 
        
        sqlite3_bind_text(statement, 1, cSearchText, -1, SQLITE_TRANSIENT); 
        
        NSString *lastContinentName = nil; 
        NSMutableArray *currentNationList; 
        
        while (sqlite3_step(statement) == SQLITE_ROW) { 
            
            const char *cContinentName = (const char *)sqlite3_column_text(statement, 0); 
            NSString *continentName = [[NSString alloc] initWithUTF8String:cContinentName]; 
            [continentName autorelease]; 
            
            // Is this a new continent? 
            if (!lastContinentName || ![lastContinentName isEqual:continentName]) { 
                // Create an array for the nations of this new continent 
                currentNationList = [[NSMutableArray alloc] init]; 
                
                // Put the name and the array in a dictionary 
                NSDictionary *continentalDict = [[NSDictionary alloc] initWithObjectsAndKeys: 
												 continentName, @"name", currentNationList, @"list", nil]; 
                
                // Release array retained by the dictionary 
                [currentNationList release]; 
                
                // Add the new continent to the array of continents 
                [continents addObject:continentalDict]; 
                
                // Release the dictionary being retained by the array 
                [continentalDict release]; 
            } 
            
            // Note the continent name so that we know if we need to make a 
            // new continent dictionary next time throught the loop 
            lastContinentName = continentName; 
            
            const char *cCountryName = (const char *)sqlite3_column_text(statement, 1); 
            NSString *countryName = [[NSString alloc] initWithUTF8String:cCountryName]; 
            [countryName autorelease]; 
            
            const char *cCountryCode = (const char *)sqlite3_column_text(statement, 2); 
            NSString *countryCode = [[NSString alloc] initWithUTF8String:cCountryCode]; 
            [countryCode autorelease]; 
            // Create a dictionary for this nation 
            NSMutableDictionary *countryDict = [[NSMutableDictionary alloc] init]; 
            [countryDict setObject:countryName forKey:@"name"]; 
            [countryDict setObject:countryCode forKey:@"code"]; 
            
            // Put the nation's dictionary in the list for the current continent 
            [currentNationList addObject:countryDict]; 
            
            // Release the dictionary retained by the array 
            [countryDict release]; 
			
		} 
		sqlite3_reset(statement);        
    } 
    
    // Load the table with the new data 
    [countryTable reloadData]; 
} 


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{ 
    // Return the number of continents 
    return [continents count]; 
} 

- (NSString *)tableView:(UITableView *)tableView 
titleForHeaderInSection:(NSInteger)section 
{ 
    // Get the dictionary for the continent for this section 
    NSDictionary *continentDict = [continents objectAtIndex:section]; 
    
    // Return the name of the continent
	return [continentDict objectForKey:@"name"]; 
} 

- (NSInteger)tableView:(UITableView *)table 
 numberOfRowsInSection:(NSInteger)section 
{ 
    // Get the dictionary for the continent for this section 
    NSDictionary *continentDict = [continents objectAtIndex:section]; 
    
    // Get the array of nations for this continent 
    NSArray *nations = [continentDict objectForKey:@"list"]; 
    
    // Return the number of nations on this continent 
    return [nations count]; 
} 


#pragma mark Table View Data Source Methods
/**
- (NSInteger)tableView:(UITableView *)table
 numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)ip 
{	
    // Get the dictionary for the continent for this section 
    NSDictionary *continentDict = [continents objectAtIndex:[ip section]]; 
    // Get the array of nations for this continent 
    NSArray *nations = [continentDict objectForKey:@"list"]; 
    
    // Which nation is at the required row? 
    NSDictionary *nationDict = [nations objectAtIndex:[ip row]]; 
	
    // What is its name? 
    NSString *nationName = [nationDict objectForKey:@"name"]; 
	
    // Try to reuse an existing cell 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"]; 
    
    // None available? 
    if (!cell) { 
        
        // Make a new cell 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:@"UITableViewCell"]; 
        [cell autorelease]; 
    } 
    
    // Put the name of the country on the cell 
    [[cell textLabel] setText:nationName]; 
    
    return cell; 
} 

/**
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)ip
{
	return nil;
}
*/
#pragma mark application Delegate Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [window makeKeyAndVisible];
	
    // Bring up the keyboard immediately
    [searchBar becomeFirstResponder];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    sqlite3_close(database);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

/**
- (void)applicationWillTerminate:(UIApplication *)application {
    
	sqlite3_close(database);
}
*/

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
