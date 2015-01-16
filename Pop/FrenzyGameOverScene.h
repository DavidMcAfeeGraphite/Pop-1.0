//
//  FrenzyGameOverScene.h
//  Pop
//
//  Created by Oscar Diplock on 18/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameCenterManager.h"
#import <GameKit/GameKit.h>

@class GameCenterManager;

@interface FrenzyGameOverScene : SKScene  <GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate>{
    int64_t  theScore;
    GameCenterManager *gameCenterManager;

}

-(id)initWithSize:(CGSize)size won:(BOOL)won;

@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, retain) NSString* currentLeaderBoard;

@property (nonatomic, assign) int64_t theScore;

@end
