//
//  Test1AppDelegate.h
//  Test1
//
//  Created by d c on 11/30/11.
//  Copyright 2011 stanford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Test1AppDelegate : NSObject <UIApplicationDelegate>
{
    
    int currentQuestionIndex;
    
    // The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    // The view objects - don't worry about this IBOutlet macro,
    // we'll talk about it shortly
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
    
    
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@end
