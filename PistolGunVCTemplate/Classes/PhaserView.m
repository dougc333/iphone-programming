//
//  PhaserView.m
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/17/10.
//  Copyright 2010 edu.canadacollege. All rights reserved.
//

#import "PhaserView.h"


@implementation PhaserView
@synthesize audioPlayer, audioPath;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
	NSLog(@"initCoder");
	if ((self = [super initWithCoder:aDecoder])) {
        //data structs init here
		self.multipleTouchEnabled=YES;
		self.audioPath = [[NSBundle mainBundle] pathForResource:@"phaser" ofType:@"mp3"];
		
    }
    return self;
}

-(void)fireGun
{
	NSLog(@"firePhaser!!");
	audioPath = [[NSBundle mainBundle] pathForResource:@"phaser" ofType:@"mp3"];
	if (self.audioPath) {
		NSLog(@"fireGun in self.audioPath");
		//NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"gunshot" ofType:@"mp3"];
		NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
		//delegate should be in view
		self.audioPlayer.delegate = self;
		//
		//self.audioPlayer.play;
		//should we add a timer here? 
		
	}
	[self playAudioFile:nil];	
	
}


-(void) stopPhaserFire
{
	NSLog(@"stop phaser fire");
	if (self.audioPlayer.isPlaying) {
		self.audioPlayer.stop;
	}
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{	
	NSLog(@"PhaserView Touches began");

	if (self.audioPlayer.isPlaying) {
		NSLog(@"PhaserView touchesBegan detected audioPlayer playing");
		[self stopPhaserFire];
	}else{
		NSLog(@"PhaserView touchesBegan audioPlayer not playing, fireGun");
		[self fireGun];
	}
	
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

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"PhaserView touches ended");
	if (self.audioPlayer.isPlaying) {
		NSLog(@"PhaserView touchesEnded");
		[self stopPhaserFire];
	}
	[self stopPhaserFire];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"PhaserView touchesCancelled");
	
}



-(void)playAudioFile:(id)sender
{
	NSLog(@"play audio file");
	[self.audioPlayer play];
	//[sender setTitle:@"Stop Audio File"	forState:UIControlStateNormal];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
