//
//  MPPlayer.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPPlayer.h"

@interface MPPlayer ()

@property (nonatomic) int realTokens;
@property (nonatomic) int tempTokens;

@end

@implementation MPPlayer

-(id) init
{
    self = [super init];
    if(self)
    {
        self.realTokens = 0;
        self.tempTokens = 0;
    }
    return self;
}

-(void) incrementTempTokens:(int)amount
{
    self.tempTokens += amount;
}

-(void) incrementTokens:(int)amount
{
    self.realTokens += amount;
}

-(void) decrementTokens:(int)amount
{
    
}


@end
