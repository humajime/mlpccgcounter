//
//  MPCounterViewController.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPCounterViewController.h"
#import "MPPlayerViewController.h"
#import "MPPlayer.h"

@interface MPCounterViewController () <MPPlayerViewControllerDelegate>

@property (strong) MPPlayerViewController *you;
@property (strong) MPPlayerViewController *them;

@property (strong, nonatomic) IBOutlet UIView *yourView;
@property (strong, nonatomic) IBOutlet UIView *theirView;

@end

@implementation MPCounterViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.you = [[MPPlayerViewController alloc] init];
    self.you.player = [MPPlayer myPlayer];
    
    self.them = [[MPPlayerViewController alloc] init];
    self.them.delegate = self;
    self.them.player = [MPPlayer theirPlayer];

    self.you.view.frame = self.yourView.bounds;
    [self.yourView addSubview:self.you.view];
    
    self.them.view.frame = self.theirView.bounds;
    [self.theirView addSubview:self.them.view];
    self.theirView.transform = CGAffineTransformMakeRotation(M_PI);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) backgroundDidChange:(UIColor *)color
{
    self.view.backgroundColor = color;
}

@end
