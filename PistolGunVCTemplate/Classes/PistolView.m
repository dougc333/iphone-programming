//
//  PistolView.m
//  PistolGun
//
//  Created by doug chang on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PistolView.h"


@implementation PistolView
@synthesize audioPlayer, audioPath;

- (id)initWithFrame:(CGRect)frame {
    NSLog(@"PistolView initFrame");
	if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	NSLog(@"PistolView initCoder");
	if ((self = [super initWithCoder:aDecoder])) {
        //data structs init here
		self.multipleTouchEnabled=YES;
		self.audioPath = [[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"];
	
    }
    return self;
}

-(void)fireGun
{
	NSLog(@"PistolView fireGun!!");
	audioPath = [[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"];
	if (self.audioPath) {
		//NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"];
		NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
		//delegate should be in view
		self.audioPlayer.delegate = self;
	}
	[self playAudioFile:nil];	
	
}


//better to put t he audioPlayer init in touchesBegan so we 
//get more rapid gun fire. Lousy programming style but it 
//makes for a better game
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"PistolView touchesBegan");
	[self fireGun];
	/**
	audioPath = [[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"];
	if (self.audioPath) {
		NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
		//delegate should be in view
		self.audioPlayer.delegate = self;
	}
	NSLog(@"touches began");
	[self playAudioFile:nil];
	*/
}

-(void)playAudioFile:(id)sender
{
	NSLog(@"PhaserView play audio file");
	[self.audioPlayer play];
	//[sender setTitle:@"Stop Audio File"	forState:UIControlStateNormal];
}

/* we need to add graphics or a placement of an image here for the score
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
