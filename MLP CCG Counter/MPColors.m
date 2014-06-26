//
//  MPColors.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPColors.h"

@implementation MPColors

+(NSDictionary *) colorsForTwilight
{
    return @{@"text":[UIColor colorWithHex:@"#131F46"],
             @"alt_text":[UIColor colorWithHex:@"#532976"],
             @"button":[UIColor colorWithHex:@"#ED438A"],
             @"body":[UIColor colorWithHex:@"#D19FE3"],
             @"outline":[UIColor colorWithHex:@"#A76BC2"],
             @"hair":[UIColor colorWithHex:@"#263773"]};
}

+(NSDictionary *) colorsForRarity
{
    return @{@"text":[UIColor colorWithHex:@"#83509F"],
             @"alt_text":[UIColor colorWithHex:@"#4B2568"],
             @"button":[UIColor colorWithHex:@"#7AD2F9"],
             @"body":[UIColor colorWithHex:@"#EBEFF1"],
             @"outline":[UIColor colorWithHex:@"#BEC2C3"],
             @"hair":[UIColor colorWithHex:@"#4B2568"]};
}

+(NSDictionary *) colorsForAppleJack
{
    return @{@"text":[UIColor colorWithHex:@"#63BC4F"],
             @"alt_text":[UIColor colorWithHex:@"#2D7B3D"],
             @"button":[UIColor colorWithHex:@"#EE4043"],
             @"body":[UIColor colorWithHex:@"#FFC261"],
             @"outline":[UIColor colorWithHex:@"#F26F31"],
             @"hair":[UIColor colorWithHex:@"#FDF6AF"]};
}

+(NSDictionary *) colorsForFluttershy
{
    return @{@"text":[UIColor colorWithHex:@"#00ADA8"],
             @"alt_text":[UIColor colorWithHex:@"#035350"],
             @"button":[UIColor colorWithHex:@"#9ED8D5"],
             @"body":[UIColor colorWithHex:@"#FDF6AF"],
             @"outline":[UIColor colorWithHex:@"#EAD463"],
             @"hair":[UIColor colorWithHex:@"#F3B6CF"]};
}

+(NSDictionary *) colorsForRainbowDash
{
    return @{@"text":[UIColor colorWithHex:@"#FDF6AF"],
             @"alt_text":[UIColor colorWithHex:@"#62BC4D"],
             @"button":[UIColor colorWithHex:@"#EE4144"],
             @"body":[UIColor colorWithHex:@"#9EDBF9"],
             @"outline":[UIColor colorWithHex:@"#77B0E0"],
             @"hair":[UIColor colorWithHex:@"#1E98D3"]};
}

+(NSDictionary *) colorsForPinkiePie
{
    return @{@"text":[UIColor colorWithHex:@"#E1F4FD"],
             @"alt_text":[UIColor colorWithHex:@"#FDF6AF"],
             @"button":[UIColor colorWithHex:@"#ED458B"],
             @"body":[UIColor colorWithHex:@"#F3B6CF"],
             @"outline":[UIColor colorWithHex:@"#EB81B4"],
             @"hair":[UIColor colorWithHex:@"#BE1D77"]};
}

+(NSDictionary *) colorsForCelestia
{
    return @{@"text":[UIColor colorWithHex:@"#FFDD86"],
             @"alt_text":[UIColor colorWithHex:@"#00AEC5"],
             @"button":[UIColor colorWithHex:@"#00B294"],
             @"body":[UIColor colorWithHex:@"#FDFAFC"],
             @"outline":[UIColor colorWithHex:@"#D99EC4"],
             @"hair":[UIColor colorWithHex:@"#97D9EF"]};
}

+(NSDictionary *) colorsForLuna
{
    return @{@"text":[UIColor colorWithHex:@"#4E2582"],
             @"alt_text":[UIColor colorWithHex:@"#0A024E"],
             @"button":[UIColor colorWithHex:@"#0A024E"],
             @"body":[UIColor colorWithHex:@"#646CB8"],
             @"outline":[UIColor colorWithHex:@"#393992"],
             @"hair":[UIColor colorWithHex:@"#7BA7F9"]};
}

+(NSArray *) allColors
{
    return @[[self colorsForTwilight], [self colorsForRarity], [self colorsForPinkiePie], [self colorsForRainbowDash], [self colorsForFluttershy], [self colorsForAppleJack], [self colorsForCelestia], [self colorsForLuna]];
}

@end
