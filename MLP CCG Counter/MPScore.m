//
//  MPScore.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPScore.h"

@implementation MPScore

+(int) tokensForScore:(int)score
{
    if(score <= 1)
        return 2;
    if(score <= 5)
        return 3;
    if(score <= 10)
        return 4;
    return 5;
}

@end
