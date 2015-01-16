//
//  arcadeScene.h
//  Pop
//
//  Created by Oscar Diplock on 17/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface arcadeScene : SKScene {
    IBOutlet SKLabelNode *myLabel;
    IBOutlet SKLabelNode *highScoreLabel;
    IBOutlet SKSpriteNode *heartOne;
    IBOutlet SKSpriteNode *heartTwo;
    IBOutlet SKSpriteNode *heartThree;
    NSInteger lives;
    int numBubbles;
    NSTimer *timer;
    
}

@end
