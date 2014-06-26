//
//  MPPlayerViewController.h
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPPlayer.h"

@protocol MPPlayerViewControllerDelegate <NSObject>

-(void) backgroundDidChange:(UIColor *)color;

@end

@interface MPPlayerViewController : UIViewController

@property (nonatomic, strong) MPPlayer *player;
@property (nonatomic) id<MPPlayerViewControllerDelegate> delegate;

@end
