//
//  arcadeScene.m
//  Pop
//
//  Created by David McAfee and Oscar Diplock.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "arcadeScene.h"
#import "ArcadeGameOverScene.h"

#import <AudioToolbox/AudioServices.h>

@interface arcadeScene ()
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) BOOL updatedHighScore;
@end

@implementation arcadeScene

- (void)update:(NSTimeInterval)currentTime {
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) {
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 0.36) {
        self.lastSpawnTimeInterval = 0;
        [self spawnBubble];
    }
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *backPic = [SKSpriteNode spriteNodeWithImageNamed:@"background_game.png"];
        backPic.size = CGSizeMake(self.size.width, self.size.height);
        backPic.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:backPic];
        
        lives = 3;
        
        myLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        
        myLabel.text = @"0";
        myLabel.fontSize = 100;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        myLabel.color = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        myLabel.alpha = 0.7;
        
        [self addChild:myLabel];
        
        highScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Mikado"];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"arcHighScore"];
        highScoreLabel.text = [NSString stringWithFormat:@"BEST %ld", (long)highScore];
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        highScoreLabel.fontSize = 30;
        highScoreLabel.position = CGPointMake(20, self.size.height-50);
        highScoreLabel.color = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        highScoreLabel.alpha = 0.7;
        
        [self addChild:highScoreLabel];
        
        _updatedHighScore = NO;
        
        heartOne = [SKSpriteNode spriteNodeWithImageNamed:@"heart.png"];
        heartOne.size = CGSizeMake(30, 30);
        heartOne.position = CGPointMake(self.size.width-100, self.size.height-40);
        heartOne.name = @"heartOne";
        [self addChild:heartOne];
        
        heartTwo = [SKSpriteNode spriteNodeWithImageNamed:@"heart.png"];
        heartTwo.size = CGSizeMake(30, 30);
        heartTwo.position = CGPointMake(self.size.width-65, self.size.height-40);
        heartTwo.name = @"heartTwo";
        [self addChild:heartTwo];
        
        heartThree = [SKSpriteNode spriteNodeWithImageNamed:@"heart.png"];
        heartThree.size = CGSizeMake(30, 30);
        heartThree.position = CGPointMake(self.size.width-30, self.size.height-40);
        heartThree.name = @"heartThree";
        [self addChild:heartThree];
    }
    return self;
}

-(void)spawnBubble{
    
    SKSpriteNode *bubble;
    
    NSInteger bubbleType = arc4random() %10;
    
    //Red Bubble
    if (bubbleType <= 1) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleRed.png"];
        bubble.name = @"badBubbleNode";
    }
    else if (bubbleType == 2) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    else if (bubbleType == 3) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    //swarm
    else if (bubbleType == 4) {
        
        NSInteger randomNumber = arc4random() % 10;
        
        switch (randomNumber)
        {
            case 0:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
            case 1:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
            case 2:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
            case 3:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
            case 4:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
            case 5:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
                
            case 6:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
                
            case 7:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
                
            case 8:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
                bubble.name = @"BubbleNode";
                break;
                
            case 9:
                bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleBlue.png"];
                bubble.name = @"swarmBubbleNode";
                break;
                
        }
        
        
    }
    //point
    else if (bubbleType == 5) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleDavid.png"];
        bubble.name = @"pointBubbleNode";
    }
    //Extra Life
    else if (bubbleType == 6) {
        
        if (lives == 1) {
            
            bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleGreen.png"];
            bubble.name = @"lifeBubbleNode";
            
        } else {
            
            bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
            bubble.name = @"BubbleNode";
            
        }
    }

    //Normal
    else if (bubbleType == 7) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }

    else if (bubbleType == 8) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    else if (bubbleType == 9) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    else if (bubbleType == 10) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    
    int bubbleSize = arc4random() %30 + 70;
    bubble.size = CGSizeMake(bubbleSize, bubbleSize);
    
    int midPt = self.frame.size.width-bubble.size.width;
    int midPtVert = -self.frame.size.height-bubble.size.height/2;
    int xPt = arc4random() %midPt + bubble.size.width/2;
    bubble.position = CGPointMake(xPt, midPtVert);
    
    [self addChild:bubble];
    
    numBubbles++;
    
    int minDuration;
    
    if (numBubbles <= 10) {
        minDuration = 3.5;
    }
    else if (numBubbles <= 20 || numBubbles >= 11) {
        minDuration = 3.2;
    }
    else if (numBubbles <= 30 || numBubbles >= 21) {
        minDuration = 3.0;
    }
    else if (numBubbles <= 40 || numBubbles >= 31) {
        minDuration = 2.8;
    }
    else if (numBubbles <= 50 || numBubbles >= 41) {
        minDuration = 2.6;
    }
    else if (numBubbles <= 60 || numBubbles >= 51) {
        minDuration = 2.4;
    }
    else if (numBubbles <= 70 || numBubbles >= 61) {
        minDuration = 2.2;
    }
    else if (numBubbles <= 80 || numBubbles >= 71) {
        minDuration = 2.1;
    }
    else if (numBubbles <= 90 || numBubbles >= 81) {
        minDuration = 1.8;
    }
    else {
        minDuration = 1.5;
    }
    
    int maxDuration = minDuration + 2.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    SKAction * actionMove = [SKAction moveTo:CGPointMake(xPt, self.scene.size.height+bubble.size.height/2) duration:actualDuration];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    SKAction * loseAction = [SKAction runBlock:^{
        SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
        if (_updatedHighScore == NO) {
            if (lives == 3) {
                heartOne.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 2;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
            else if (lives == 2) {
                heartTwo.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 1;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
            else if (lives == 1) {
                heartThree.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 0;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
            else {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                NSInteger lastScore = [myLabel.text integerValue];
                [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"arcLastScore"];
                SKScene * gameOverScene = [[ArcadeGameOverScene alloc] initWithSize:self.size won:NO];
                [self.view presentScene:gameOverScene transition: reveal];
            }
        }
        else {
            if (lives == 3) {
                heartOne.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 2;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                
            }
            else if (lives == 2) {
                heartTwo.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 1;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
            else if (lives == 1) {
                heartThree.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 0;
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
            else {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                NSInteger lastScore = [myLabel.text integerValue];
                [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"arcLastScore"];
                SKScene * gameOverScene = [[ArcadeGameOverScene alloc] initWithSize:self.size won:YES];
                [self.view presentScene:gameOverScene transition: reveal];
            }
        }
    }];
    if ([bubble.name isEqualToString:@"badBubbleNode"] || [bubble.name isEqualToString:@"lifeBubbleNode"]) {
        [bubble runAction:[SKAction sequence:@[actionMove, actionMoveDone]]];
    }
    else {
        [bubble runAction:[SKAction sequence:@[actionMove, loseAction, actionMoveDone]]];
    }
}

-(void) showActivity {
    
            [self spawnBubble];
    [self spawnBubble];
            [self spawnBubble2];
            NSLog(@"Second wave");

    }

-(void)spawnBubble2{
    
    SKSpriteNode *bubble;
    
    NSInteger bubbleType = arc4random() %10;
    
    //Bubble
    if (bubbleType <=2) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
        
        
    }
    
    else if (bubbleType == 3) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleDavid.png"];
        bubble.name = @"pointBubbleNode";
    }
    
    else if (bubbleType == 4) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    //point
    else if (bubbleType == 5) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleDavid.png"];
        bubble.name = @"pointBubbleNode";
    }
    //Extra Life
    else if (bubbleType == 6) {
        
        if (lives == 1) {
            
            bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleGreen.png"];
            bubble.name = @"lifeBubbleNode";
            
        } else {
        
            bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
            bubble.name = @"BubbleNode";
            
        }
    }
    
    //Normal
    else if (bubbleType == 7) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
    
    else if (bubbleType == 8) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleDavid.png"];
        bubble.name = @"pointBubbleNode";
    }
    
    else if (bubbleType == 9) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubbleDavid.png"];
        bubble.name = @"pointBubbleNode";
    }
    
    else if (bubbleType == 10) {
        bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        bubble.name = @"BubbleNode";
    }
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
    
    if ([[touchedNode name] isEqualToString:@"BubbleNode"]||[[touchedNode name] isEqualToString:@"swarmBubbleNode"]||[[touchedNode name] isEqualToString:@"pointBubbleNode"]||[[touchedNode name] isEqualToString:@"lifeBubbleNode"]) {
        [touchedNode removeFromParent];
        
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        
        SKAction *fadeIn = [SKAction fadeAlphaTo:0.9 duration:0.1];
        SKAction *fadeOut = [SKAction fadeAlphaTo:0.3 duration:0.1];
        SKAction *pulse = [SKAction sequence:@[fadeIn,fadeOut]];
        
        [myLabel runAction:pulse];
        
        NSInteger additionInt = 1;
        
        SKEmitterNode *explosion = [self pop];
        explosion.position = touchedNode.position;
        [self addChild:explosion];
        
        [touchedNode removeFromParent];
        
        SKAction *wait = [SKAction waitForDuration:0.5];
        SKAction *remove = [SKAction removeFromParent];
        [explosion runAction:[SKAction sequence:@[wait, remove]]];
        
        if ([[touchedNode name] isEqualToString:@"swarmBubbleNode"]) {
            [self spawnBubble];
            [self spawnBubble];
            [self spawnBubble];
            [self spawnBubble2];
            [self spawnBubble];
            
            timer = [NSTimer scheduledTimerWithTimeInterval: 0.75
                                                target: self
                                              selector: @selector(showActivity)
                                              userInfo: nil
                                               repeats: NO];
            
        }
        else if ([[touchedNode name] isEqualToString:@"pointBubbleNode"]) {
            additionInt = 2;
            
        }
        else if ([[touchedNode name] isEqualToString:@"lifeBubbleNode"]) {
            if (lives < 3) {
                lives++;
                if (lives == 1) {
                    heartThree.texture = [SKTexture textureWithImageNamed:@"heart.png"];
                }
                else if (lives == 2) {
                    heartTwo.texture = [SKTexture textureWithImageNamed:@"heart.png"];
                }
                else if (lives == 3) {
                    heartOne.texture = [SKTexture textureWithImageNamed:@"heart.png"];
                }
            }
        }
        NSInteger labelInt = [myLabel.text intValue];
        NSInteger newLabelInt = labelInt+additionInt;
        myLabel.text = [NSString stringWithFormat:@"%ld", (long)newLabelInt];
        
        NSInteger highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"arcHighScore"];
        if (newLabelInt > highScore || !highScore) {
            NSInteger newHighScore = newLabelInt;
            [[NSUserDefaults standardUserDefaults] setInteger:newHighScore forKey:@"arcHighScore"];
            _updatedHighScore = YES;
            
            highScoreLabel.text = [NSString stringWithFormat:@"Best %ld", (long)newHighScore];
            [highScoreLabel runAction:pulse];
        }
    }
    else if ([[touchedNode name] isEqualToString:@"badBubbleNode"]) {
        [self runAction:[SKAction playSoundFileNamed:@"pop.mp3" waitForCompletion:NO]];
        [touchedNode removeFromParent];
        [self loseAction];
    }
}

-(void)loseAction {
    SKAction * loseAction = [SKAction runBlock:^{
        SKTransition *reveal = [SKTransition crossFadeWithDuration:0.5];
        if (_updatedHighScore == NO) {
            if (lives == 3) {
                heartOne.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 2;
            }
            else if (lives == 2) {
                heartTwo.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 1;
            }
            else if (lives == 1) {
                heartThree.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 0;
            }
            else {
                NSInteger lastScore = [myLabel.text integerValue];
                [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"arcLastScore"];
                SKScene * gameOverScene = [[ArcadeGameOverScene alloc] initWithSize:self.size won:NO];
                [self.view presentScene:gameOverScene transition: reveal];
            }
        }
        else {
            if (lives == 3) {
                heartOne.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 2;
            }
            else if (lives == 2) {
                heartTwo.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 1;
            }
            else if (lives == 1) {
                heartThree.texture = [SKTexture textureWithImageNamed:@"heartBroken.png"];
                lives = 0;
            }
            else {
                
                
                NSInteger lastScore = [myLabel.text integerValue];
                [[NSUserDefaults standardUserDefaults] setInteger:lastScore forKey:@"arcLastScore"];
                SKScene * gameOverScene = [[ArcadeGameOverScene alloc] initWithSize:self.size won:YES];
                [self.view presentScene:gameOverScene transition: reveal];
            }
        }
    }];
    [self runAction:loseAction];
}

@end
