//
//  QuizAppDelegate.h
//  Quiz
//
//  Created by doug chang on 8/22/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	NSMutableArray *questions;
	NSMutableArray *answers;
	int currentQuestionsIndex;
	IBOutlet UILabel *questionField;
	IBOutlet UILabel *answerField;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end

