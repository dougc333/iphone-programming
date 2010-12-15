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


 -(id)init
{
	 [super initWithNibName:@"ItemDetailViewController" bundle:nil];	 
	 UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] 
											 initWithBarButtonSystemItem:UIBarButtonSystemItemCamera 
											 target:self action:@selector(takePicture:)];
	 [[self navigationItem] setRightBarButtonItem:cameraBarButtonItem];
	 [cameraBarButtonItem release];
	 return self;	
}
 
 -(void)takePicture:(id)sender{
	 [[self view] endEditing:YES];
	 UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
 
	 if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) 
	 {
		[imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
	 }else 
	 {
		 [imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
//		[imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
	 }
	 [imagePicker setDelegate:self];
	 [self presentModalViewController:imagePicker animated:YES];
	 [imagePicker release];
 }
 
 -(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
 {
	 NSString *oldKey = [editingPossession imageKey];
	 if (oldKey) {
		 [[ImageCache sharedImageCache] deleteImageForKey:oldKey];
	 }
	 UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	 CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
	 CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault,newUniqueID);
	 [editingPossession setImageKey:(NSString *)newUniqueIDString];
	 CFRelease(newUniqueIDString);
	 CFRelease(newUniqueID);
	 [[ImageCache sharedImageCache] setImage:image forKey:[editingPossession imageKey]];
	 [imageView setImage:image];
	 [self dismissModalViewControllerAnimated:YES];
 }


-(BOOL) testFieldShouldReturn:(UITextField*)textField{
	[textField resignFirstResponder];
	return YES;
}



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
	NSString *imageKey = [editingPossession imageKey];
	if (imageKey) {
		UIImage *imageToDisplay = [[ImageCache sharedImageCache] imageForKey:imageKey];
		[imageView setImage:imageToDisplay];
	}else{
		[imageView setImage:nil];
	}
	
	
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
	
	[imageView release];
	imageView = nil;
}


- (void)dealloc {
	[nameField release];
	[imageView release];
    [super dealloc];
}


@end
