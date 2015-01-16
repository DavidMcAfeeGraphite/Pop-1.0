//
//  ViewController.h
//  Pop
//
//  Created by Oscar Diplock on 16/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"


@class GameCenterManager;


@interface ViewController : UIViewController <ADBannerViewDelegate, AVAudioPlayerDelegate> {
    ADBannerView *adView;
    BOOL bannerIsVisible;
    IBOutlet UILabel *stateLabel;
    IBOutlet UIImageView *load;
    
    IBOutlet UIButton *nc;
    IBOutlet UIButton *game;
    
    IBOutlet UIButton *classicTutorial;
    IBOutlet UIButton *classicButton;
    
    IBOutlet UIButton *arcadeTutorial;
    IBOutlet UIButton *arcadeButton;
    
    IBOutlet UIButton *frenzyTutorial;
    IBOutlet UIButton *frenzyButton;
    IBOutlet UIView *aboutView;
    IBOutlet UIView *tutorialView;
    
     NSTimer *timer;
    NSTimer *loadTimer;
     NSTimer *audioTimer;
    NSTimer *audioTimer2;
    GameCenterManager *gameCenterManager;
    AVAudioPlayer *player;
    AVAudioPlayer *player2;
}
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) AVAudioPlayer *player2;
@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, retain) NSString* currentLeaderBoard;
@property (nonatomic,assign) BOOL bannerIsVisible;
@property (weak, nonatomic) IBOutlet ADBannerView *adView;
@end
