//
//  GameOverScene.h
//  Pop
//
//  Created by Oscar Diplock on 16/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameCenterManager.h"
#import <GameKit/GameKit.h>
#import "ViewController.h"

@class GameCenterManager;
@class SpriteViewController;

@interface GameOverScene : SKScene  <GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate> {
    IBOutlet UILabel *label;
    
    GameCenterManager *gameCenterManager;
    int64_t  theScore;
    

}
@property (nonatomic, weak) SpriteViewController *spriteViewController;
@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, retain) NSString* currentLeaderBoard;

-(id)initWithSize:(CGSize)size won:(BOOL)won;
@property (nonatomic, assign) int64_t theScore;


@end
