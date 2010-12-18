//
//  PhaserView.h
//  PistolGunVCTemplate
//
//  Created by doug chang on 12/17/10.
//  Copyright 2010 edu.canadacollege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PhaserView : UIView <AVAudioPlayerDelegate >{
	UIImageView *view;
	AVAudioPlayer *audioPlayer;
	NSString *audioPath;
}

@property (nonatomic, retain) IBOutlet AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) NSString * audioPath;
-(void)playAudioFile:(id)sender;
-(void) fireGun;


@end
