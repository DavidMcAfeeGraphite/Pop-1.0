//
//  GameOverScene.m
//  Pop
//
//  Created by Oscar Diplock on 16/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "GameOverScene.h"
#import "classicScene.h"
#import "HomeScene.h"
#import "AppSpecificValues.h"
#import <Social/Social.h>

@implementation GameOverScene
@synthesize gameCenterManager;
@synthesize currentLeaderBoard;
@synthesize theScore;

-(id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"background_with_art.png"];
        backPic.size = CGSizeMake(self.size.width, self.size.height);
        backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backPic];
        
//        NSString * message;
//        if (won) {
//            message = @"New High Score!";
//        } else {
//            message = @"Game Over";
//        }
//        
//        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Noteworthy-Bold"];
//        label.text = message;
//        label.fontSize = 40;
//        label.fontColor = [SKColor darkGrayColor];
//        label.position = CGPointMake(self.size.width/2, self.size.height/2+150);
//        [self addChild:label];
        
        
        
        SKSpriteNode *home = [SKSpriteNode spriteNodeWithImageNamed:@"trans.png"];
        home.size = CGSizeMake(50, 50);
        home.position = CGPointMake(self.size.width/2, self.size.height/2 -160);
        home.name = @"home";
        [self addChild:home];
        
        SKSpriteNode *facebook = [SKSpriteNode spriteNodeWithImageNamed:@"button_facebook-2.png"];
        facebook.size = CGSizeMake(55, 55);
        facebook.position = CGPointMake(self.size.width/2 - 99, self.size.height/2 -115);
        facebook.name = @"facebook";
        [self addChild:facebook];
        
        SKSpriteNode *twitter = [SKSpriteNode spriteNodeWithImageNamed:@"button_twitter-2.png"];
        twitter.size = CGSizeMake(55, 55);
        twitter.position = CGPointMake(self.size.width/2 + 99, self.size.height/2 -115);
        twitter.name = @"twitter";
        [self addChild:twitter];
        
        SKLabelNode *homeText = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        homeText.text = @"BACK";
        homeText.fontSize = 20;
        homeText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        homeText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        homeText.fontColor = [SKColor lightTextColor];
        homeText.position = CGPointMake(self.size.width/2 -55, self.size.height/2 - 175);
        homeText.name = @"homeText";
        [self addChild:homeText];
        
        SKLabelNode *tutorialText = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        tutorialText.text = @"TUTORIAL";
        tutorialText.fontSize = 20;
        tutorialText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        tutorialText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        tutorialText.fontColor = [SKColor lightTextColor];
        tutorialText.position = CGPointMake(self.size.width/2 + 45, self.size.height/2 - 175);
        tutorialText.name = @"tutorialText";
        [self addChild:tutorialText];
        
        SKSpriteNode *restart = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleBlue.png"];
        restart.size = CGSizeMake(175, 175);
        restart.position = CGPointMake(self.size.width/2, self.size.height/2 -40);
        restart.name = @"restart";
        [self addChild:restart];
        
        SKAction *rotation = [SKAction rotateByAngle: -M_PI*1200000 duration:600000.0];
        
        [restart runAction: rotation];
        
        SKSpriteNode *restar = [SKSpriteNode spriteNodeWithImageNamed:@"label_tryagain (1).png"];
        restar.size = CGSizeMake(230, 70);
        restar.position = CGPointMake(self.size.width/2, self.size.height/2 -40);
        restar.name = @"restar";
        [self addChild:restar];
        
//        SKLabelNode *restartText = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
//        restartText.text = @"↺";
//        restartText.fontSize = 50;
//        restartText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        restartText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//        restartText.fontColor = [SKColor darkGrayColor];
//        restartText.position = CGPointMake(self.size.width/2, self.size.height/2);
//        restartText.name = @"restartText";
//        [self addChild:restartText];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
        SKLabelNode *highScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        highScoreLabel.text = [NSString stringWithFormat:@"BEST %ld", (long)highScore];
    
        theScore = highScore;
        
        GKScore *scoreReporter = [[GKScore alloc] initWithLeaderboardIdentifier:@"ClassicLB"]; scoreReporter.value = theScore; [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) { if (error != nil){ NSLog(@"Submitting score failed"); } else { NSLog(@"Submitting score succeeded"); } }];
        
        
        highScoreLabel.fontSize = 30;
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        highScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        highScoreLabel.fontColor = [SKColor lightTextColor];
        highScoreLabel.position = CGPointMake(self.size.width/2 +70, self.size.height/2+240);
        highScoreLabel.name = @"highScoreLabel";
        [self addChild:highScoreLabel];
        
        NSInteger lastScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastScore"];
        SKLabelNode *lastScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        lastScoreLabel.text = [NSString stringWithFormat:@"%ld", (long)lastScore];
        lastScoreLabel.fontSize = 50;
        lastScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        lastScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        lastScoreLabel.fontColor = [SKColor lightTextColor];
        lastScoreLabel.position = CGPointMake(self.size.width/2 -110, self.size.height/2+240);
        lastScoreLabel.name = @"lastScoreLabel";
        [self addChild:lastScoreLabel];
        
        NSString *score = [lastScoreLabel text];
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:score forKey:@"score"];
        
        [defaults synchronize];
        
        NSLog(@"Data saved");
        

       

        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:location];
    
    if ([[touchedNode name] isEqualToString:@"restart"]||[[touchedNode name] isEqualToString:@"restar"]) {
        
        NSString *scene =@"scene";
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:scene forKey:@"scene"];
        [defaults synchronize];
        
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[classicScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
            
        }]
         ];
    } else if ([[touchedNode name] isEqualToString:@"tutorialText"]||[[touchedNode name] isEqualToString:@"tutorialText"]) {
        
        
        UIImageView *load = [[UIImageView alloc] initWithImage:nil];
        load.image = [UIImage imageNamed:@"tutorial_classic.png"];
        load.frame = CGRectMake(0,0, 320, 570);
        [self.view addSubview:load];
        
        load.alpha = 1;
        
        
        
        [UIView animateWithDuration:0.9 delay:1.5 options:0 animations:^{
            
            load.alpha = 0.0;
        } completion:^(BOOL finished) {
            load.hidden = YES;
        }];

        
        
        
    } else if ([[touchedNode name] isEqualToString:@"twitter"]||[[touchedNode name] isEqualToString:@"twitter"]) {
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
//
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
           // [touchedNode removeFromParent];
            
            [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];

            
            
            
//            SLComposeViewController *composeController = [SLComposeViewController
//                                                          composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            
            SLComposeViewController *tweetSheet = [SLComposeViewController
                                                   composeViewControllerForServiceType:
                                                   SLServiceTypeTwitter];
            
                        tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
                switch(result) {
                        
                    case SLComposeViewControllerResultCancelled:
                        
                        
                        break;
                        
                        
                    case SLComposeViewControllerResultDone:
                        break;
                }
            };
            
            NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
            
           
            
            [tweetSheet setInitialText: [NSString stringWithFormat:@"Can you beat my Pop high score in classic mode? Get Pop for iOS. I got a score of %1d. https://itunes.apple.com/us/app/pop/id950936583?mt=8",(long)highScore]] ;
            
            
            
//            
//            if (![tweetSheet addImage:@""]) {
//                NSLog(@"Error: Unable to add image");
//            }
            
            
                       UIViewController *controller = self.view.window.rootViewController;
            [controller presentViewController:tweetSheet animated: YES completion:nil]; 
        
            
            
        }else {
            
            NSLog(@"We gots no twitter");
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Pop" message:@"It looks as though you haven't set up Twitter under the settings menu."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    
    
    
    } else if ([[touchedNode name] isEqualToString:@"facebook"]||[[touchedNode name] isEqualToString:@"facebook"]) {
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            //
            
            
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            //[touchedNode removeFromParent];
            
            [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];

            
         
            
            
            SLComposeViewController *tweetSheet = [SLComposeViewController
                                                   composeViewControllerForServiceType:
                                                   SLServiceTypeFacebook];
            
            tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
                switch(result) {
                        
                    case SLComposeViewControllerResultCancelled:
                        
                        
                        break;
                        
                        
                    case SLComposeViewControllerResultDone:
                        break;
                }
            };
            
            NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
            
            
            
            [tweetSheet setInitialText: [NSString stringWithFormat:@"Can you beat my Pop high score in classic mode? Get Pop for iOS. I got a score of %1d.  https://itunes.apple.com/us/app/pop/id950936583?mt=8",(long)highScore]] ;
            
            
            
            //
            //            if (![tweetSheet addImage:@""]) {
            //                NSLog(@"Error: Unable to add image");
            //            }
            
//            
//            if (![tweetSheet addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/pop/id950936583?mt=8"]]){
//                NSLog(@"Error: Unable to URL");
//            }
            UIViewController *controller = self.view.window.rootViewController;
            [controller presentViewController:tweetSheet animated: YES completion:nil];
            
            
            
        }else {
            
            NSLog(@"We gots no twitter");
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Pop" message:@"It looks as though you haven't set up Facebook under the settings menu."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        
        
        
        
        
    }
    
    
    
    else if ([[touchedNode name] isEqualToString:@"home"]||[[touchedNode name] isEqualToString:@"homeText"]) {
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[HomeScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
            NSString *scene =@"home";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:scene forKey:@"scene"];
            [defaults synchronize];
            
        }]
         ];
    }
}

-(SKEmitterNode *)pop {
    NSString *popPath = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"sks"];
    
    SKEmitterNode *burst = [NSKeyedUnarchiver unarchiveObjectWithFile:popPath];
    
    return burst;
}

@end