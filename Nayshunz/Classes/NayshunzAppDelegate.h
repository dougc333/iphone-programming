//
//  NayshunzAppDelegate.h
//  Nayshunz
//
//  Created by doug chang on 11/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface NayshunzAppDelegate : NSObject <UIApplicationDelegate, UITableViewDataSource> {
    UIWindow *window;
	IBOutlet UITableView *countryTable;
	IBOutlet UISearchBar *searchBar;
	//Model
	NSMutableArray *continents;
	sqlite3 *database;
	sqlite3_stmt *statement;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

