//
//  QuizAppDelegate.m
//  Quiz
//
//  Created by doug chang on 8/22/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "QuizAppDelegate.h"

@implementation QuizAppDelegate

@synthesize window;

-(id)init{
	[super init];
	questions = [[NSMutableArray alloc] init];
	answers = [[NSMutableArray alloc] init];
	
	[questions addObject:@"What is 7+7?"];
	[answers addObject:@"14"];
	
	[questions addObject:@"What is the color of Quan's hair?"];
	[answers addObject:@"purple"];
	
	[questions addObject:@"What is the capital of Vermont?"];
	[answers addObject:@"Montpeler"];
	
	[questions addObject:@"What is cognac made of?"];
	[answers addObject:@"Grapes"];
	
	return self;
	
}

-(IBAction) showQuestion:(id)sender{
	currentQuestionsIndex++;
	
	if(currentQuestionsIndex == [questions count]){
		currentQuestionsIndex = 0; //go back to first question if we reached last question
	}
	
	NSString *question = [questions objectAtIndex:currentQuestionsIndex];
	NSLog(@"displaying question:%@",question );
	[questionField setText:question];
	[answerField setText:@"???"];
}

-(IBAction)showAnswer:(id)sender{
	NSString *answer = [answers objectAtIndex:currentQuestionsIndex];
	[answerField setText:answer];
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
