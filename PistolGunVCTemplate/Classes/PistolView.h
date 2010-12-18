//
//  PistolView.h
//  PistolGun
//
//  Created by doug chang on 12/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface PistolView : UIView < AVAudioPlayerDelegate > {
	UIImageView *view;
	AVAudioPlayer *audioPlayer;
	NSString *audioPath;
}

@property (nonatomic, retain) IBOutlet AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) NSString * audioPath;
-(void)playAudioFile:(id)sender;
-(void) fireGun;

@end
