//
//  FrenzyGameOverScene.m
//  Pop
//
//  Created by Oscar Diplock and David McAfee.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "FrenzyGameOverScene.h"
#import "frenzyScene.h"
#import "HomeScene.h"
#import <Social/Social.h>

@implementation FrenzyGameOverScene
@synthesize gameCenterManager;
@synthesize currentLeaderBoard;
@synthesize theScore;

-(id)initWithSize:(CGSize)size won:(BOOL)won {
    
    
    if (self = [super initWithSize:size]) {
        SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"Gameover.png"];
        backPic.size = CGSizeMake(self.size.width, self.size.height);
        backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backPic];
        
        
        UISwipeGestureRecognizer *longHold = [[UILongPressGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(longPress)];
        
        [self.view addGestureRecognizer:longHold];
        
//        NSString * message;
//        if (won) {
//            message = @"New High Score!";
//        } else {
//            message = @"Game Over";
//        }
//        
//        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Superclarendon"];
//        label.text = message;
//        label.fontSize = 40;
//        label.fontColor = [SKColor darkGrayColor];
//        label.position = CGPointMake(self.size.width/2, self.size.height/2+150);
//        [self addChild:label];
        NSString *deviceType = [UIDevice currentDevice].model;
        
        
        SKSpriteNode *home = [SKSpriteNode spriteNodeWithImageNamed:@"trans.png"];
        home.size = CGSizeMake(50, 50);
        home.position = CGPointMake(self.size.width/2, self.size.height/2 -160);
        home.name = @"home";
        [self addChild:home];
        
        SKSpriteNode *facebook = [SKSpriteNode spriteNodeWithImageNamed:@"button_facebook-2.png"];
        facebook.size = CGSizeMake(55, 55);
        if([deviceType hasPrefix:@"iPad"])
        { facebook.position = CGPointMake(self.size.width/2 - 149, self.size.height/2 -315);
        }else {
            facebook.position = CGPointMake(self.size.width/2 - 99, self.size.height/2 -115); }
        facebook.name = @"facebook";
        [self addChild:facebook];
        
        SKSpriteNode *twitter = [SKSpriteNode spriteNodeWithImageNamed:@"button_twitter-2.png"];
        twitter.size = CGSizeMake(55, 55);
        if([deviceType hasPrefix:@"iPad"])
        { twitter.position = CGPointMake(self.size.width/2 + 149, self.size.height/2 -315);
            
        } else {
            twitter.position = CGPointMake(self.size.width/2 + 99, self.size.height/2 -115); }
        twitter.name = @"twitter";
        [self addChild:twitter];
        
        SKLabelNode *homeText = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        homeText.text = @"BACK";
        homeText.fontSize = 20;
        homeText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        homeText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        homeText.fontColor = [SKColor lightTextColor];
        
        if([deviceType hasPrefix:@"iPad"])
        {
        homeText.position = CGPointMake(self.size.width/2 -55, self.size.height/2 - 375);
            
        } else {
            homeText.position = CGPointMake(self.size.width/2 -55, self.size.height/2 - 165);
        }
        homeText.name = @"homeText";
        [self addChild:homeText];
        
        SKLabelNode *tutorialText = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        tutorialText.text = @"TUTORIAL";
        tutorialText.fontSize = 20;
        tutorialText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        tutorialText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        tutorialText.fontColor = [SKColor lightTextColor];
        
        if([deviceType hasPrefix:@"iPad"])
        {
            tutorialText.position = CGPointMake(self.size.width/2 + 45, self.size.height/2 - 375);
        }else {
        tutorialText.position = CGPointMake(self.size.width/2 + 45, self.size.height/2 - 165);
            
        }
        
        tutorialText.name = @"tutorialText";
        [self addChild:tutorialText];
        
        SKSpriteNode *restart = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleRed.png"];
        
        
        
        if([deviceType hasPrefix:@"iPad"])
        {
            restart.size = CGSizeMake(350, 350);
            restart.position = CGPointMake(self.size.width/2, self.size.height/2 -140);
            

        }
        
            else {
                
                restart.size = CGSizeMake(175, 175);
                restart.position = CGPointMake(self.size.width/2, self.size.height/2 -40);
                
                
            }
        
        restart.name = @"restart";
        [self addChild:restart];
        
        SKAction *rotation = [SKAction rotateByAngle: -M_PI*120000000 duration:60000000.0];
        
        [restart runAction: rotation];
        
        SKSpriteNode *restar = [SKSpriteNode spriteNodeWithImageNamed:@"label_tryagain (1).png"];
        
        if([deviceType hasPrefix:@"iPad"])
        {
            restar.size = CGSizeMake(350, 107);
            restar.position = CGPointMake(self.size.width/2, self.size.height/2 -140);
            
        }
        
        else {
        restar.size = CGSizeMake(230, 70);
        restar.position = CGPointMake(self.size.width/2, self.size.height/2 -40);
            
        }
        restar.name = @"restar";
        [self addChild:restar];
        
//        SKLabelNode *restartText = [SKLabelNode labelNodeWithFontNamed:@"Superclarendon"];
//        restartText.text = @"↺";
//        restartText.fontSize = 50;
//        restartText.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        restartText.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//        restartText.fontColor = [SKColor darkGrayColor];
//        restartText.position = CGPointMake(self.size.width/2, self.size.height/2);
//        restartText.name = @"restartText";
//        [self addChild:restartText];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"frenzyHighScore"];
        SKLabelNode *highScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        highScoreLabel.text = [NSString stringWithFormat:@"BEST %ld", (long)highScore];
        
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        highScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        highScoreLabel.fontColor = [SKColor lightTextColor];
        
        
        
        if([deviceType hasPrefix:@"iPad"])
        {
        highScoreLabel.position = CGPointMake(self.size.width/2 +150, self.size.height/2 +400);
            NSLog(@"iPad");
            highScoreLabel.fontSize = 55;
            
        }
    else if([deviceType hasPrefix:@"iPhone4"])
        {
        highScoreLabel.position = CGPointMake(self.size.width/2 +70, self.size.height/2 +200);
            NSLog(@"iPhone 4s");
            highScoreLabel.fontSize = 30;
            
        }
     
      
        else {
           highScoreLabel.position = CGPointMake(self.size.width/2 +70, self.size.height/2 +240);
            NSLog(@"iPhone 5 or higher");
             highScoreLabel.fontSize = 30;
        }
            
        highScoreLabel.name = @"highScoreLabel";
        [self addChild:highScoreLabel];
        
        
        theScore = highScore;
        
        GKScore *scoreReporter = [[GKScore alloc] initWithLeaderboardIdentifier:@"FrenzyLB"]; scoreReporter.value = theScore; [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) { if (error != nil){ NSLog(@"Submitting score failed"); } else { NSLog(@"Submitting score succeeded"); } }];
        
        
        NSInteger lastScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"frenzyLastScore"];
        SKLabelNode *lastScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        lastScoreLabel.text = [NSString stringWithFormat:@"%ld", (long)lastScore];
        
        lastScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        lastScoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        lastScoreLabel.fontColor = [SKColor lightTextColor];
        
        if([deviceType hasPrefix:@"iPad"])
        {
        lastScoreLabel.position = CGPointMake(self.size.width/2 -250, self.size.height/2 +400);
            lastScoreLabel.fontSize = 90;
        }
            else {
                lastScoreLabel.position = CGPointMake(self.size.width/2 -110, self.size.height/2 +240);
                NSLog(@"iPhone");
                lastScoreLabel.fontSize = 50;
            }

        lastScoreLabel.name = @"lastScoreLabel";
        [self addChild:lastScoreLabel];
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
            SKScene * myScene = [[frenzyScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
        }]
         ];
    } else if ([[touchedNode name] isEqualToString:@"tutorialText"]||[[touchedNode name] isEqualToString:@"tutorialText"]) {
        
        
        NSString *deviceType = [UIDevice currentDevice].model;
        
        UIImageView *load = [[UIImageView alloc] initWithImage:nil];
        
        if([deviceType hasPrefix:@"iPad"]){
            load.image = [UIImage imageNamed:@"ipad_frenzy.png"];
            
            load.frame = CGRectMake(0,0, 768, 1024); }
        
        else  if ([deviceType hasPrefix:@"iPhone"]) {
            
            load.image = [UIImage imageNamed:@"tutorial_frenzy-2.png"];
            
            load.frame = CGRectMake(0,0, 320, 570); }
        
        [self.view addSubview:load];
        
        load.alpha = 1;
        
        
        //UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewHide:)];
        
        //[self.view addGestureRecognizer:tapRecognizer];
        
        [UIView animateWithDuration:0.9 delay:3.5 options:0 animations:^{
            
            load.alpha = 0.0;
        } completion:^(BOOL finished) {
            load.hidden = YES;
        }];
        
    }
    
    else if ([[touchedNode name] isEqualToString:@"twitter"]||[[touchedNode name] isEqualToString:@"twitter"]) {
        
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        //[touchedNode removeFromParent];
        
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        SKAction *wait = [SKAction waitForDuration:0.3];
        SKAction *remove = [SKAction removeFromParent];

        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            //
            
            
            
            
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
           
            NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"frenzyHighScore"];
            
            
            
            [tweetSheet setInitialText: [NSString stringWithFormat:@"Can you beat my Pop high score in frenzy mode? Get Pop for iOS. I got a score of %1d. https://itunes.apple.com/au/app/pop-the-addictive-bubble-game/id921264311?mt=8",(long)highScore]] ;
            
            
            
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
            
            SKAction *wait = [SKAction waitForDuration:0.3];
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
            
           NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"frenzyHighScore"];
            
            
            
            [tweetSheet setInitialText: [NSString stringWithFormat:@"Can you beat my Pop high score in frenzy mode? Get Pop for iOS. I got a score of %1d. https://itunes.apple.com/au/app/pop-the-addictive-bubble-game/id921264311?mt=8",(long)highScore]] ;
            
            
            
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

//-(void)viewHide:(UITapGestureRecognizer*)sender {
  //
    //  load.alpha=0;
      //NSLog(@"View gone");
      //load.hidden =YES;
      
    //}

-(SKEmitterNode *)pop {
    NSString *popPath = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"sks"];
    
    SKEmitterNode *burst = [NSKeyedUnarchiver unarchiveObjectWithFile:popPath];
    
    return burst;
}

@end