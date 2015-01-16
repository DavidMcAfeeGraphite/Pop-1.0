//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

@synthesize border;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CALayer * layer = [border layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:20.0];
    border.alpha = 0.0;
    [layer setBorderWidth:5.0];
    [layer setBorderColor:[[UIColor grayColor] CGColor]];

    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.infoLabel.text = self.infoText;
    self.backgroundImageViewHeart.image = [UIImage imageNamed:self.heartFile];
    self.backgroundImageViewRY.image = [UIImage imageNamed:self.redYelFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
