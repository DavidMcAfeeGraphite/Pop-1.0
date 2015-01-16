//
//  ViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface TutorialViewController : UIViewController <UIPageViewControllerDataSource> {
    
    IBOutlet UIButton *startButton;
    
}

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) UIButton *startButton;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray *pageInfo;
@property (strong, nonatomic) NSArray *imageHeart;
@property (strong, nonatomic) NSArray *imageRY;

@end
