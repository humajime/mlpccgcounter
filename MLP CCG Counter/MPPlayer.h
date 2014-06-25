//
//  MPPlayer.h
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPPlayer : NSObject

@property (readonly) int tokens;

-(void) incrementTokens:(int)amount;
-(void) decrementTokens:(int)amount;
-(void) incrementTempTokens:(int)amount;
-(void) endOfTurn;
-(void) startOfTurn;

@end
