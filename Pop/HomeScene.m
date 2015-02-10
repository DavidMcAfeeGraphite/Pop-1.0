//
//  HomeScene.m
//  Pop
//
//  Created by Oscar Diplock on 17/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//
#import "ViewController.h"
#import "HomeScene.h"
#import "classicScene.h"
#import "arcadeScene.h"
#import "frenzyScene.h"
#import <AVFoundation/AVFoundation.h>

@implementation HomeScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        static dispatch_once_t once;
        dispatch_once(&once, ^ {
            //[self runAction:[SKAction playSoundFileNamed:@"Monkeys Spinning Monkeys.mp3" waitForCompletion:YES]];
            
            
        });
        
        
        [adView removeFromSuperview];
        
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        
        self.bannerIsVisible = NO;
        
        adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        
        
        NSString *deviceType = [UIDevice currentDevice].model;
        
            if([deviceType hasPrefix:@"iPad"])
            {
                NSLog(@"iPad");
        
                //adView.frame = CGRectOffset(adView.frame, 50, 380);
                
            } else {
        adView.frame = CGRectOffset(adView.frame, 0, -50);
                NSLog(@"iPhone");
        
            }
        
        
        SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"background_with_icons.png"];
        backPic.size = CGSizeMake(self.size.width, self.size.height);
        backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backPic];
        
        
        SKSpriteNode *title = [SKSpriteNode spriteNodeWithImageNamed:@"trans.png"];
  title.size = CGSizeMake(280, 150);        title.position = CGPointMake(self.size.width/2, self.size.height-100);
        title.name = @"title";
        [self addChild:title];
        
         adView.hidden = YES;
        
        SKSpriteNode *classicMode = [SKSpriteNode spriteNodeWithImageNamed:@"button_classic.png"];
        classicMode.size = CGSizeMake(170, 100);
        classicMode.position = CGPointMake(self.size.width/2, self.size.height/2+65);
        classicMode.name = @"classicMode";
        [self addChild:classicMode];
        
//        SKLabelNode *classicTitle = [SKLabelNode labelNodeWithFontNamed:@"Noteworthy"];
//        classicTitle.text = @"Classic";
//        classicTitle.fontSize = 25;
//        classicTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        classicTitle.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//        classicTitle.fontColor = [SKColor darkGrayColor];
//        classicTitle.position = CGPointMake(self.size.width/2, self.size.height/2+60);
//        classicTitle.name = @"classicTitle";
//        [self addChild:classicTitle];
        
        SKSpriteNode *arcadeMode = [SKSpriteNode spriteNodeWithImageNamed:@"button_arcade.png"];
        arcadeMode.size = CGSizeMake(160, 100);
        arcadeMode.position = CGPointMake(self.size.width/2, self.size.height/2-50);
        arcadeMode.name = @"arcadeMode";
        [self addChild:arcadeMode];
        
//        SKLabelNode *arcadeTitle = [SKLabelNode labelNodeWithFontNamed:@"Noteworthy"];
//        arcadeTitle.text = @"Arcade";
//        arcadeTitle.fontSize = 25;
//        arcadeTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        arcadeTitle.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//        arcadeTitle.fontColor = [SKColor darkGrayColor];
//        arcadeTitle.position = CGPointMake(self.size.width/2, self.size.height/2-70);
//        arcadeTitle.name = @"arcadeTitle";
//        [self addChild:arcadeTitle];
        
        SKSpriteNode *frenzyMode = [SKSpriteNode spriteNodeWithImageNamed:@"button_frenzy.png"];
        frenzyMode.size = CGSizeMake(160, 100);
        frenzyMode.position = CGPointMake(self.size.width/2, self.size.height/2-165);
        frenzyMode.name = @"frenzyMode";
        [self addChild:frenzyMode];
        
//        SKLabelNode *frenzyTitle = [SKLabelNode labelNodeWithFontNamed:@"Noteworthy"];
//        frenzyTitle.text = @"Frenzy";
//        frenzyTitle.fontSize = 25;
//        frenzyTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
//        frenzyTitle.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
//        frenzyTitle.fontColor = [SKColor darkGrayColor];
//        frenzyTitle.position = CGPointMake(self.size.width/2, self.size.height/2-200);
//        frenzyTitle.name = @"frenzyTitle";
//        [self addChild:frenzyTitle];
        
        //SKLabelNode *graphite = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRomanPS-BoldMT"];
//graphite.text = @"NC";
        //graphite.fontSize = 30;
        //graphite.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        //graphite.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        //graphite.fontColor = [SKColor darkGrayColor];
        //graphite.position = CGPointMake(35, 25);
        //graphite.name = @"graphite";
        //[self addChild:graphite];
    }
    return self;
}

-(SKEmitterNode *)pop {
    NSString *popPath = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"sks"];
    
    SKEmitterNode *burst = [NSKeyedUnarchiver unarchiveObjectWithFile:popPath];
    
    return burst;
}

- (BOOL)prefersStatusBarHidden {return YES;}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    
    
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:location];
    
    if ([[touchedNode name] isEqualToString:@"title"]||[[touchedNode name] isEqualToString:@"title"]) {
        
      
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
        
            
        
    }
    
    if ([[touchedNode name] isEqualToString:@"classicMode"]||[[touchedNode name] isEqualToString:@"classicTitle"]) {
         [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        [touchedNode removeFromParent];
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
//        
//        SKSpriteNode *load = [SKSpriteNode spriteNodeWithImageNamed:@"Pop loading screen.png"];
//        load.size = CGSizeMake(self.size.width, self.size.height);
//        load.position = CGPointMake(self.size.width/2, self.size.height/2);
//        [self addChild:load];
//
//        
//        load.alpha = 1;
//        
//        
//        
//        [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//            
//            load.alpha = 0.0f;
//        } completion:^(BOOL finished) {
//            load.hidden = YES;
//        }];
        
    
        
        
        BOOL ranBeforec2 = [[NSUserDefaults standardUserDefaults]boolForKey:@"RanBeforec2"];
        if(!ranBeforec2) {
             [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            [touchedNode removeFromParent];
            
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];
            [explosion runAction:[SKAction sequence:@[wait, remove]]];
            
            //[load setHidden: YES];
            SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_classic.png"];
            backPic.size = CGSizeMake(self.size.width, self.size.height);
            backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
            [self addChild:backPic];
            
            SKSpriteNode *classicStart = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_classic.png"];
            classicStart.size = CGSizeMake(self.size.width, self.size.height);
            classicStart.position = CGPointMake(self.size.width/2, self.size.height/2);
            classicStart.name = @"classicStart";
            [self addChild:classicStart];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RanBeforec2"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
//             [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
//            SKEmitterNode *explosion = [self pop];
//            explosion.position = touchedNode.position;
//            [self addChild:explosion];
//            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
//            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
//            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
//            
//            [touchedNode removeFromParent];
//            SKAction *wait = [SKAction waitForDuration:0.5];
//            SKAction *remove = [SKAction removeFromParent];
//            [explosion runAction:[SKAction sequence:@[wait, remove]]];
            
//            SKSpriteNode *load = [SKSpriteNode spriteNodeWithImageNamed:@"Pop loading screen.png"];
//            load.size = CGSizeMake(self.size.width, self.size.height);
//            load.position = CGPointMake(self.size.width/2, self.size.height/2);
//            [self addChild:load];
//            
//            
//            load.alpha = 1;
//            
//            
//            
//            [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//                
//                load.alpha = 0.0f;
//            } completion:^(BOOL finished) {
//                load.hidden = YES;
//            }];
            

            
            
            NSLog(@"lol");
            
            [self runAction:
             [SKAction runBlock:^{
                SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
                SKScene * myScene = [[classicScene alloc] initWithSize:self.size];
                [self.view presentScene:myScene transition: reveal];
                
                
                NSString *scene =@"scene";
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:scene forKey:@"scene"];
                [defaults synchronize];
            }]
             ];}
    } else if ([[touchedNode name] isEqualToString:@"arcadeStart"]||[[touchedNode name] isEqualToString:@"arcadeStart"]) {
     
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        [touchedNode removeFromParent];
        
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
        SKSpriteNode *load = [SKSpriteNode spriteNodeWithImageNamed:@"Pop loading screen.png"];
        load.size = CGSizeMake(self.size.width, self.size.height);
        load.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:load];
        
        
        load.alpha = 1;
        
        
        
        [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
            
            load.alpha = 0.0f;
        } completion:^(BOOL finished) {
            load.hidden = YES;
        }];
        
    
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[arcadeScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
            
            NSString *scene =@"scene";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:scene forKey:@"scene"];
            [defaults synchronize];
        }]
         ];
    
    }
    else if ([[touchedNode name] isEqualToString:@"classicStart"]||[[touchedNode name] isEqualToString:@"classicStart"]) {
         [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        [touchedNode removeFromParent];
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
       
//        UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//        load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//        load.frame = CGRectMake(0,0, 320, 570);
//        [self.view addSubview:load];
//        
//        load.alpha = 1;
//        
//        [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//            
//            load.alpha = 0.0f;
//        } completion:^(BOOL finished) {
//            load.hidden = YES;
//        }];
//        
//        [load stopAnimating];
        
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[classicScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
            
            NSString *scene =@"scene";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:scene forKey:@"scene"];
            [defaults synchronize];
        }]
         ];
        
    }
    
    
    
    else if ([[touchedNode name] isEqualToString:@"frenzyStart"]||[[touchedNode name] isEqualToString:@"frenzyStart"]) {
         [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        
        [touchedNode removeFromParent];
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
        
//        UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//        load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//        load.frame = CGRectMake(0,0, 320, 570);
//        [self.view addSubview:load];
//        
//        load.alpha = 1;
//        
//        
//        [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//            
//            load.alpha = 0.0f;
//        } completion:^(BOOL finished) {
//            load.hidden = YES;
//        }];
//        
      
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[frenzyScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
            
            NSString *scene =@"scene";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:scene forKey:@"scene"];
            [defaults synchronize];
        }]
         ];
        
    }
    else if ([[touchedNode name] isEqualToString:@"arcadeMode"]||[[touchedNode name] isEqualToString:@"arcadeTitle"]) {
        BOOL ranBeforea2 = [[NSUserDefaults standardUserDefaults]boolForKey:@"RanBeforea2"];
        if(!ranBeforea2) {
            
            [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            [touchedNode removeFromParent];
            
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];
            [explosion runAction:[SKAction sequence:@[wait, remove]]];
//            UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//            load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//            load.frame = CGRectMake(0,0, 320, 570);
//            [self.view addSubview:load];
//            
//            load.alpha = 1;
//            
//            
//            
//            [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//                
//                load.alpha = 0.0f;
//            } completion:^(BOOL finished) {
//                load.hidden = YES;
//            }];
//            
//            [load stopAnimating];
            
//            [load setHidden: YES];
            SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_arcade.png"];
            backPic.size = CGSizeMake(self.size.width, self.size.height);
            backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
            [self addChild:backPic];
            
            SKSpriteNode *arcadeStart = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_arcade.png"];
            arcadeStart.size = CGSizeMake(self.size.width, self.size.height);
            arcadeStart.position = CGPointMake(self.size.width/2, self.size.height/2);
            arcadeStart.name = @"arcadeStart";
            [self addChild:arcadeStart];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RanBeforea2"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
            
            
            
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            [touchedNode removeFromParent];
            [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];
            [explosion runAction:[SKAction sequence:@[wait, remove]]];
            
//            UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//            load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//            load.frame = CGRectMake(0,0, 320, 570);
//            [self.view addSubview:load];
//            
//            load.alpha = 1;
//            
//            
//            [UIView animateWithDuration:0.9 delay:0.5 options:0 animations:^{
//                
//                load.alpha = 0.0f;
//            } completion:^(BOOL finished) {
//                load.hidden = YES;
//            }];
//            
//            [load stopAnimating];
            
            
            NSLog(@"lol");
            
            [self runAction:
             [SKAction runBlock:^{
                SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
                SKScene * myScene = [[arcadeScene alloc] initWithSize:self.size];
                [self.view presentScene:myScene transition: reveal];
                
                
                NSString *scene =@"scene";
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:scene forKey:@"scene"];
                [defaults synchronize];
            }]
             ];}

    }
    else if ([[touchedNode name] isEqualToString:@"frenzyMode"]||[[touchedNode name] isEqualToString:@"frenzyTitle"]) {
        BOOL ranBeforef2 = [[NSUserDefaults standardUserDefaults]boolForKey:@"RanBeforef2"];
        if(!ranBeforef2) {
             [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            [touchedNode removeFromParent];
            
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];
            [explosion runAction:[SKAction sequence:@[wait, remove]]];
            
//            UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//            load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//            load.frame = CGRectMake(0,0, 320, 570);
//            [self.view addSubview:load];
//            
//            load.alpha = 1;
//            
//        
//            
//            [UIView animateWithDuration:0.9 delay:0.7 options:0 animations:^{
//                
//                load.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                load.hidden = YES;
//            }];
//            
//            [load stopAnimating];
//            
//            [load setHidden: YES];
            SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_frenzy.png"];
            backPic.size = CGSizeMake(self.size.width, self.size.height);
            backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
            [self addChild:backPic];
            
            SKSpriteNode *frenzyStart = [SKSpriteNode spriteNodeWithImageNamed:@"tutorial_frenzy.png"];
            frenzyStart.size = CGSizeMake(self.size.width, self.size.height);
            frenzyStart.position = CGPointMake(self.size.width/2, self.size.height/2);
            frenzyStart.name = @"frenzyStart";
            [self addChild:frenzyStart];
            
            
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RanBeforef2"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
            
             [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
            SKEmitterNode *explosion = [self pop];
            explosion.position = touchedNode.position;
            [self addChild:explosion];
            SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
            SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
            SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
            
            [touchedNode removeFromParent];
            SKAction *wait = [SKAction waitForDuration:0.5];
            SKAction *remove = [SKAction removeFromParent];
            [explosion runAction:[SKAction sequence:@[wait, remove]]];
            
//            UIImageView *load = [[UIImageView alloc] initWithImage:nil];
//            load.image = [UIImage imageNamed:@"Pop loading screen.png"];
//            load.frame = CGRectMake(0,0, 320, 570);
//            [self.view addSubview:load];
//            
//            load.alpha = 1;
//            
//            [UIView animateWithDuration:0.9 delay:0.7 options:0 animations:^{
//                
//                load.alpha = 0.0f;
//            } completion:^(BOOL finished) {
//                load.hidden = YES;
//            }];
//            
            NSLog(@"lol");
        
        [self runAction:
         [SKAction runBlock:^{
            SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
            SKScene * myScene = [[frenzyScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            
                       
            NSString *scene =@"scene";
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:scene forKey:@"scene"];
            [defaults synchronize];
        }]
         ];}
    }

    else if ([[touchedNode name] isEqualToString:@"graphite"]) {
        [self runAction:
         [SKAction runBlock:^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://graphite.education"]];
        }]
         ];
    }
}

-(void)viewDidAppear {
    
    adView.alpha = 0;
    [adView removeFromSuperview];
}



@end
