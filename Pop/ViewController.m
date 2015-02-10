//
//  ViewController.m
//  Pop
//
//  Created by Oscar Diplock on 16/09/2014.
//  Copyright (c) 2014 GRAPHITE. All rights reserved.
//

#import "ViewController.h"
#import "HomeScene.h"
#import <AVFoundation/AVFoundation.h>
#import "AppSpecificValues.h"


@interface ViewController () {
    
}

//-(void)authenticateLocalPlayer;

@end

@implementation ViewController
@synthesize gameCenterManager;
@synthesize currentLeaderBoard;
@synthesize player;



//-(void)authenticateLocalPlayer{
//    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
//    
//    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
//        if (viewController != nil) {
//            [self presentViewController:viewController animated:YES completion:nil];
//        }
//        else{
//            if ([GKLocalPlayer localPlayer].authenticated) {
//                _gameCenterEnabled = YES;
//                
//                // Get the default leaderboard identifier.
//                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
//                    
//                    if (error != nil) {
//                        NSLog(@"%@", [error localizedDescription]);
//                    }
//                    else{
//                        _leaderboardIdentifier = leaderboardIdentifier;
//                    }
//                }];
//            }
//            
//            else{
//                _gameCenterEnabled = NO;
//            }
//        }
//    };
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                target: self
                                              selector: @selector(showActivity)
                                              userInfo: nil
                                               repeats: YES];
    
     audioTimer = [NSTimer scheduledTimerWithTimeInterval: 130.0
                                             target: self
                                           selector: @selector(showActivity3)
                                           userInfo: nil
                                            repeats: YES];
    
    
    audioTimer2 = [NSTimer scheduledTimerWithTimeInterval: 130.0
                                                   target: self
                                                 selector: @selector(showActivity4)
                                                 userInfo: nil
                                                  repeats: YES];

   
    adView.alpha = 0;
    

    
}

-(void)showActivity3 {
//    
//    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
//    resourcePath = [resourcePath stringByAppendingString:@"Monkey.mp3"];
//    NSLog(@"Path to play: %@", resourcePath);
//    NSError* err;
//    
//    
//    player = [[AVAudioPlayer alloc] initWithContentsOfURL:
//              [NSURL fileURLWithPath:resourcePath] error:&err];
//    
//    
//    NSLog(@"called upon");
//    player.delegate = self;
//    
//    player.numberOfLoops = -1;
//    [player play];
// 
    
}

-(void)showActivity4 {
    
//    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
//    resourcePath = [resourcePath stringByAppendingString:@"Monkey.mp3"];
//    NSLog(@"Path to play: %@", resourcePath);
//    NSError* err;
//   
//    
//    
//    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:
//              [NSURL fileURLWithPath:resourcePath] error:&err];
//    
//    player2.delegate = self;
//    [player2 play];
//    player2.numberOfLoops = 20;
//    player2.currentTime = 0;
//    player2.volume = 1.0;
//    
//    if( err ){
//        
//        NSLog(@"Failed with reason: %@", [err localizedDescription]);
//        
//        player2.delegate = self;
//        [player2 play];
//        player2.numberOfLoops = 20;
//        player2.currentTime = 0;
//        player2.volume = 1.0;
//    }
//    else{
//        player2.delegate = self;
//        [player2 play];
//        player2.numberOfLoops = 20;
//        player2.currentTime = 0;
//        player2.volume = 1.0;
//    }

    
}

-(IBAction)openLeaderboard {
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init]; if (leaderboardController != nil){ leaderboardController.leaderboardDelegate = self; [self presentModalViewController: leaderboardController animated: YES]; }

}


- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{ [self dismissModalViewControllerAnimated:YES];
}


-(void)showActivity {
    
    NSLog(@"triggered");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *scene = [defaults objectForKey:@"scene"];
    stateLabel.text = scene;
    
    if([stateLabel.text isEqual:@"scene"]) {
       
        self.adView.alpha = 1.0;
        [adView setHidden:NO];
        NSLog(@"game");
        
        
    } else {
        [adView setHidden:YES];
        self.adView.alpha = 0.0;
        NSLog(@"menu");
        
    }
    
    
    
    
}


- (BOOL)prefersStatusBarHidden {return YES;}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        
        [nc setHidden:YES];
        [game setHidden:YES];
        
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}


-(void)showActivity2 {
    
    [load stopAnimating];
    [UIView animateWithDuration:0.9 delay:0.0 options:0 animations:^{
        
        load.alpha = 0.0f;
    } completion:^(BOOL finished) {
        load.hidden = YES;
    }];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"Shake it Baby");
        
        if (player.playing) {
            
            [player stop];
        } else {
            
            
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Monkeys Spinning Monkeys.mp3", [[NSBundle mainBundle] resourcePath]]];
            
            NSError *error;
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            player.numberOfLoops = -1;
            
            if (player == nil)
                NSLog([error description]);
            else
                [player play];
            
            
            
            
            
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    adView.alpha = 0;
    [load setHidden:YES];
    [aboutView setHidden:YES];
    
   self.adView.delegate = self;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
//    if([deviceType hasPrefix:@"iPad"])
//    {
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Pop" message:@"Pop has not been specifically optimised for iPad and as such you may experience unusual or strange graphical behaviour. For best gameplay results, play Pop on your iPhone or iPod touch."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alert show];
//
//        
//    } else {
//        
//        NSLog(@"iPhone dawg");
//    }
    
    BOOL ranBefore14 = [[NSUserDefaults standardUserDefaults]boolForKey:@"RanBefore14"];
    if(!ranBefore14) {
        
       
        UIImageView *load = [[UIImageView alloc] initWithImage:nil];
        load.image = [UIImage imageNamed:@"pop_splash.png"];
        load.frame = CGRectMake(0,0, 320, 570);
        [self.view addSubview:load];
        
        load.alpha = 1;
        
        
        
        [UIView animateWithDuration:0.9 delay:5.0 options:0 animations:^{
            
            load.alpha = 0.0;
        } completion:^(BOOL finished) {
            load.hidden = YES;
        }];
        
        
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RanBefore14"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        
        
        
        
        NSLog(@"lol");
    }

    
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    NSDate *now = [NSDate date];
    NSDate *dateToFire = [now dateByAddingTimeInterval:86400];
    
    NSLog(@"now time: %@", now);
    NSLog(@"fire time: %@", dateToFire);
    
    localNotification.fireDate = dateToFire;
    localNotification.alertBody = @"Ready to play another game of Pop? Pop some bubbles now!";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Monkeys Spinning Monkeys.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    player.numberOfLoops = -1;
    
    if (player == nil)
        NSLog([error description]);
    else
        [player play];
    

        
//    load.animationImages = [NSArray arrayWithObjects: [UIImage imageNamed:@"1load.png"], [UIImage imageNamed:@"2load.png"], [UIImage imageNamed:@"3load.png"], [UIImage imageNamed:@"4load.png"], nil];
//    load.animationDuration = 1.0f;
//    [load startAnimating];
//    
//    
//    [nc setHidden:NO];
//    [game setHidden:NO];
//    
//    load.alpha = 1;
//    
//    loadTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                             target: self
//                                           selector: @selector(showActivity2)
//                                           userInfo: nil
//                                            repeats: NO];
    
    
    
    self.currentLeaderBoard = kLeaderboardID;
    
    if ([GameCenterManager isGameCenterAvailable]) {
        
        self.gameCenterManager = [[GameCenterManager alloc] init];
        [self.gameCenterManager setDelegate:self];
        [self.gameCenterManager authenticateLocalUser];
        
        
        
    } else {
        
        NSLog(@"Device does not support game centre");
        
    }

}
//    [self authenticateLocalPlayer];

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(SKEmitterNode *)pop {
    NSString *popPath = [[NSBundle mainBundle] pathForResource:@"pop" ofType:@"sks"];
    
    SKEmitterNode *burst = [NSKeyedUnarchiver unarchiveObjectWithFile:popPath];
    
    return burst;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

-(IBAction)tutorial {
    
    [aboutView setHidden:NO];
}

-(IBAction)exitView {
    
        [aboutView setHidden:YES];
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
        SKView * skView = (SKView *)self.view;
    if (!skView.scene) {
        
        
        
        // Create and configure the scene.
        SKScene * scene = [HomeScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end