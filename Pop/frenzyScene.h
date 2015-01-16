//
//  frenzyScene.h
//  Pop
//
//  Created by Oscar Diplock on 18/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface frenzyScene : SKScene <UIAlertViewDelegate>{
    IBOutlet SKLabelNode *myLabel;
    IBOutlet SKLabelNode *highScoreLabel;
    BOOL isAlertViewActive;
    int numBubbles;
}

@end
