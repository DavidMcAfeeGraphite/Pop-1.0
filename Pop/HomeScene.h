//
//  HomeScene.h
//  Pop
//
//  Created by Oscar Diplock on 17/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>
#import "ViewController.h"

@interface HomeScene : SKScene  <ADBannerViewDelegate> {
    ADBannerView *adView;
    BOOL bannerIsVisible;
    BOOL isSoundActionCompleted;
    NSTimer *loadTimer;
    AVAudioPlayer *player;
}

@property (nonatomic,assign) BOOL bannerIsVisible;

@end
