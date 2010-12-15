//
//  WebViewController.h
//  Page
//
//  Created by doug chang on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
	NSURL *theURL;
	NSString *theTitle;
	UIWebView *webView;
	UINavigationItem *webTitle;
}

@property (nonatomic,retain) NSURL *theURL;
@property (nonatomic,retain) NSString *theTitle;
@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic,retain) IBOutlet UINavigationItem *webTitle;

-(id)initWithURL:(NSURL *)aURL;
-(id)initWithURL:(NSURL *)aURL andTitle:(NSString *)aTitle;
-(IBAction)done;


@end
