//
//  classicScene.h
//  Pop
//
//  Created by Oscar Diplock on 16/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface classicScene : SKScene <UIAlertViewDelegate> {
    IBOutlet SKLabelNode *myLabel;
    IBOutlet SKLabelNode *highScoreLabel;
    BOOL isAlertViewActive;
    int numBubbles;
}

@end
