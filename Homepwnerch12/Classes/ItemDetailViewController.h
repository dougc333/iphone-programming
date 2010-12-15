//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by doug chang on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Possessions;

@interface ItemDetailViewController : UIViewController {
	IBOutlet UITextField *nameField;
    IBOutlet UITextField *serialNumberField;
    IBOutlet UITextField *valueField;
    IBOutlet UILabel *dateLabel;
	Possessions *editingPossession;
}
@property (nonatomic, assign) Possessions *editingPossession;


@end
