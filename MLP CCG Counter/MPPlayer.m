//
//  MPPlayer.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPPlayer.h"
#import "MPScore.h"

@interface MPPlayer ()

@property (nonatomic) int realTokens;
@property (nonatomic) int tempTokens;

@end

@implementation MPPlayer

+(MPPlayer *) myPlayer
{
    static MPPlayer *myplayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myplayer = [[MPPlayer alloc] init];
        [myplayer reset];
    });
    return myplayer;
}

+(MPPlayer *) theirPlayer
{
    static MPPlayer *theirplayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theirplayer = [[MPPlayer alloc] init];
        [theirplayer reset];
    });
    return theirplayer;
}

+(int) highestScore
{
    return MAX([self myPlayer].score, [self theirPlayer].score);
}

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

-(void) reset
{
    self.realTokens = 0;
    self.tempTokens = 0;
    self.score = 0;
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
    while(self.tempTokens > 0 && amount > 0)
    {
        self.tempTokens -= 1;
        amount -= 1;
    }
    self.realTokens -= amount;
}

-(int) tokens
{
    return self.realTokens + self.tempTokens;
}

-(BOOL) hasTempTokens
{
    return self.tempTokens > 0;
}

-(void) endOfTurn
{
    self.tempTokens = 0;
}

-(void) startOfTurn
{
    self.realTokens += [MPScore tokensForScore:[MPPlayer highestScore]];
}

@end
