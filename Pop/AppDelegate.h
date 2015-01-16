//
//  AppDelegate.h
//  Pop
//
//  Created by Oscar Diplock on 29/07/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {
    AVAudioPlayer *player;
}
@property (nonatomic, retain) AVAudioPlayer *player;

@property (strong, nonatomic) UIWindow *window;

@end
