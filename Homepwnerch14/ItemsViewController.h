//
//  ItemsViewController.h
//  Homepwner
//
//  Created by doug chang on 10/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;

@interface ItemsViewController : UITableViewController {
	ItemDetailViewController *detailViewController;
	NSMutableArray *possessions;
}
@property (nonatomic,retain) NSMutableArray *possessions;

@end
