//
//  MPPlayer.h
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPPlayer : NSObject

+(MPPlayer *) myPlayer;
+(MPPlayer *) theirPlayer;
+(int) highestScore;

@property (readonly) int tokens;
@property (readonly) BOOL hasTempTokens;
@property (nonatomic) int score;
@property BOOL isActivePlayer;

-(void) incrementTokens:(int)amount;
-(void) decrementTokens:(int)amount;
-(void) incrementTempTokens:(int)amount;
-(void) endOfTurn;
-(void) startOfTurn;
-(void) reset;

@end
