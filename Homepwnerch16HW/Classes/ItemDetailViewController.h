//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by doug chang on 10/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCache.h"

@class Possessions;

@interface ItemDetailViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate> 
{
	IBOutlet UITextField *nameField;
    IBOutlet UITextField *serialNumberField;
    IBOutlet UITextField *valueField;
    IBOutlet UILabel *dateLabel;
	IBOutlet UIImageView *imageView;
	Possessions *editingPossession;
}
@property (nonatomic, assign) Possessions *editingPossession;

@end
