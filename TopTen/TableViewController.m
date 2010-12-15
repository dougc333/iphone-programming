    //
//  TableViewController.m
//  TopTen
//
//  Created by doug chang on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController
@synthesize songs, xmlData, connectionInProgress;

-(void)viewWillAppear:(BOOL)animated{
	NSLog(@"view will appear");
	[super viewWillAppear:animated];
	[self loadSongs];
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
	NSLog(@"connection did receive data!!! %@",data);
	[self.xmlData appendData:data];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqual:@"title"]) {
        NSLog(@"found title!");
        titleString = [[NSMutableString alloc] init];
		NSLog(@"titleString:%@",titleString);
    }
}

- (void)parser:(NSXMLParser *)parser    foundCharacters:(NSString *)string
{
    [titleString appendString:string];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:@"title"]) {
        NSLog(@"ended title: %@", titleString);
        [songs addObject:titleString];
		
        // Release and nil titleString so that the next time characters
        // are found and not within a title tag, they are ignored
        [titleString release];
        titleString = nil;
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
//	NSString *xmlCheck = [[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] autorelease];
//	NSLog(@"xml check:%@",xmlCheck);
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
	[parser setDelegate:self];
	[parser parse];
	[parser release];
	[[self tableView] reloadData];
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*) error{
	NSLog(@"connection did fail with error!!!!");
	[connectionInProgress release];
	self.connectionInProgress = nil;
	[xmlData release];
	self.xmlData = nil;
	NSString *errorString = [NSString stringWithFormat:@"fetch failed:%@",[error localizedDescription]];
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:errorString delegate:nil cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil];
	[actionSheet showInView:[[self view] window ]];
	[actionSheet autorelease];
}

-(void)loadSongs{
	NSLog(@"loadSongs");
	[songs removeAllObjects];
	[[self tableView] reloadData];
	NSURL *url = [NSURL URLWithString:@"http://ax.itunes.apple.com"
				  @"/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/"
				  @"limit=10/xml"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url
							cachePolicy:NSURLRequestReloadIgnoringCacheData
							timeoutInterval:100];
	if (self.connectionInProgress) {
		[self.connectionInProgress cancel];
		[self.connectionInProgress release];
	}
	
	[self.xmlData release];
	self.xmlData = [[NSMutableData alloc]init];
	self.connectionInProgress = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
	
	
}


-(id)initWithStyle:(UITableViewStyle)style{
	if (self=[super initWithStyle:style]) {
		self.songs = [[NSMutableArray alloc]init];
	}
	return self;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.songs count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath* ) indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (cell==nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
	}
	[[cell textLabel] setText:[self.songs objectAtIndex:[indexPath row]]];
	return cell;
	
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[titleString release];
	self.songs = nil;
	self.xmlData = nil;
	self.connectionInProgress = nil;
    [super dealloc];
}


@end
