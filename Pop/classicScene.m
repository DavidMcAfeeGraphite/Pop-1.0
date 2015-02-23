//
//  classicScene.m
//  Pop
//
//  Created by Oscar Diplock and David McAfee.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "classicScene.h"
#import "GameOverScene.h"
#import "ClassicTutScene.h"
#import "HomeScene.h"
#import <AudioToolbox/AudioServices.h>


@interface classicScene ()
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) BOOL updatedHighScore;
@end

@implementation classicScene

- (void)update:(NSTimeInterval)currentTime {
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 0.2) {
        timeSinceLast = 0.2 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    
    if (numBubbles <= 30) {
        if (self.lastSpawnTimeInterval > 0.5) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
                [self spawnBubble];
            }
            }
    }
    
    else if (numBubbles <= 90 || numBubbles >= 31) {
        if (self.lastSpawnTimeInterval > 0.52) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
            [self spawnBubble];
            [self spawnBubble];
            }}}
    
    else if (numBubbles <= 150 || numBubbles >= 91) {
        if (self.lastSpawnTimeInterval > 0.65) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
                [self spawnBubble];
                [self spawnBubble];
                 [self spawnBubble];
            }}}
    else if (numBubbles <= 200 || numBubbles >= 151) {
        if (self.lastSpawnTimeInterval > 0.55) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
                [self spawnBubble];
                [self spawnBubble];
                 [self spawnBubble];
            }}}
    
    else if (numBubbles <= 300 || numBubbles >= 201) {
        if (self.lastSpawnTimeInterval > 0.4) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
                [self spawnBubble];
                [self spawnBubble];
                 [self spawnBubble];
            }}}
    
    else if (numBubbles <= 400 || numBubbles >= 301) {
        if (self.lastSpawnTimeInterval > 0.20) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
                [self spawnBubble];
                [self spawnBubble];
                 [self spawnBubble];
            }}}
    
    else {
        
        if (self.lastSpawnTimeInterval > 0.19) {
            self.lastSpawnTimeInterval = 0;
            if (isAlertViewActive == NO) {
            [self spawnBubble];
                [self spawnBubble];
                [self spawnBubble];}
            
        }
        
        
        
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        isAlertViewActive = NO;
    }
}

-(void)longPress:(UILongPressGestureRecognizer*)sender {
    
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

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        
        
                
        isAlertViewActive = NO;
        
        SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"Gameback.png"];
        backPic.size = CGSizeMake(self.size.width, self.size.height);
        backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backPic];
        
        numBubbles = 0;
        
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        
        myLabel.text = @"0";
        myLabel.fontSize = 100;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        myLabel.color = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        myLabel.alpha = 0.7;
        
        [self addChild:myLabel];
        
        highScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
        highScoreLabel.text = [NSString stringWithFormat:@"BEST %ld", (long)highScore];
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        highScoreLabel.fontSize = 30;
        highScoreLabel.position = CGPointMake(20, self.size.height-50);
        highScoreLabel.color = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        highScoreLabel.alpha = 0.7;
        
        [self addChild:highScoreLabel];
        
        
        
        modeLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        
        
        modeLabel.text = @"CLASSIC";
        modeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        modeLabel.fontSize = 30;
        modeLabel.position = CGPointMake(170, self.size.height-50);
        modeLabel.color = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        modeLabel.alpha = 0.7;
        
        [self addChild:modeLabel];
        
        _updatedHighScore = NO;
    }
    return self;
}

-(void)spawnBubble{
    SKSpriteNode *bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
    
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType hasPrefix:@"iPad"])
    {
        NSLog(@"iPad");
        
        int bubbleSize = arc4random() %25 + 127;
        bubble.size = CGSizeMake(bubbleSize, bubbleSize);
        
        
    }
 else {
    
    int bubbleSize = arc4random() %15 + 80;
    bubble.size = CGSizeMake(bubbleSize, bubbleSize);
 }

    int midPt = self.frame.size.width-bubble.size.width;
    int midPtVert = -self.frame.size.height-bubble.size.height/2;
    int xPt = arc4random() %midPt + bubble.size.width/2;
    bubble.position = CGPointMake(xPt, midPtVert);
    
    bubble.name = @"BubbleNode";
    
    [self addChild:bubble];
        
    

    numBubbles++;
    
    int minDuration;
    
    if (numBubbles <= 10) {
        minDuration = 5.5;
    }
    else if (numBubbles <= 20 || numBubbles >= 11) {
        minDuration = 4.3;
    }
    else if (numBubbles <= 30 || numBubbles >= 21) {
        minDuration = 3.4;
    }
    else if (numBubbles <= 40 || numBubbles >= 31) {
        minDuration = 3.0;
    }
    else if (numBubbles <= 50 || numBubbles >= 41) {
        minDuration = 2.0;
    }
    else if (numBubbles <= 60 || numBubbles >= 51) {
        minDuration = 1.6;
    }
    else if (numBubbles <= 70 || numBubbles >= 61) {
        minDuration = 1.4;
    }
    else if (numBubbles <= 80 || numBubbles >= 71) {
        minDuration = 1.2;
    }
else if (numBubbles <= 90 || numBubbles >= 81) {
        minDuration = 1.05;
    }
    else {
        minDuration = 0.95;
    }
    
    int maxDuration = minDuration + 1.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    SKAction * actionMove = [SKAction moveTo:CGPointMake(xPt, self.scene.size.height+bubble.size.height/2) duration:actualDuration];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    SKAction * loseAction = [SKAction runBlock:^{
        SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
        if (_updatedHighScore == NO) {
            NSInteger lastScore = [myLabel.text integerValue];
            [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"lastScore"];
            SKScene * gameOverScene = [[GameOverScene alloc] initWithSize:self.size won:NO];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [self.view presentScene:gameOverScene transition: reveal];
        }
        else {
            NSInteger lastScore = [myLabel.text integerValue];
            [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"lastScore"];
            SKScene * gameOverScene = [[GameOverScene alloc] initWithSize:self.size won:YES];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [self.view presentScene:gameOverScene transition: reveal];
        }
    }];
    [bubble runAction:[SKAction sequence:@[actionMove, loseAction, actionMoveDone]]];
    }

-(SKEmitterNode *)pop {
    NSString *firePath = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"sks"];
    
    SKEmitterNode *burst = [NSKeyedUnarchiver unarchiveObjectWithFile:firePath];
    
    return burst;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];

    
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:location];
    
    if ([[touchedNode name] isEqualToString:@"BubbleNode"]) {
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        NSInteger labelInt = [myLabel.text intValue];
        NSInteger newLabelInt = labelInt+1;
        
        myLabel.text = [NSString stringWithFormat:@"%ld", (long)newLabelInt];
        
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.7 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.1 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        
        [myLabel runAction:pulse];
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        
        [touchedNode removeFromParent];

        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScore"];
        if (newLabelInt > highScore || !highScore) {
            NSInteger newHighScore = newLabelInt;
            [[NSUserDefaults standardUserDefaults] setInteger:newHighScore forKey:@"highScore"];
            _updatedHighScore = YES;
            
            highScoreLabel.text = [NSString stringWithFormat:@"BEST %ld", (long)newHighScore];
            [highScoreLabel runAction:pulse];
        }
    }
}

@end