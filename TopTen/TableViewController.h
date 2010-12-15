//
//  TableViewController.h
//  TopTen
//
//  Created by doug chang on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewController : UITableViewController <NSXMLParserDelegate>{
	NSMutableString *titleString;
	NSMutableArray *songs;
	NSMutableData *xmlData;
	NSURLConnection *connectionInProgress;
}

@property (nonatomic,retain) NSMutableArray *songs;
@property (nonatomic,retain) NSMutableData *xmlData;
@property (nonatomic,retain) NSURLConnection *connectionInProgress;

-(void) loadSongs;
@end
