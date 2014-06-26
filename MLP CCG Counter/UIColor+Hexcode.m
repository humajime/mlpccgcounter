//
//  UIColor+UIColor_Hexcode.m
//  Calorie Count
//
//  Created by Andrew Zimmer on 11/18/11.
//  Copyright (c) 2011 About.com. All rights reserved.
//

#import "UIColor+Hexcode.h"

@implementation UIColor (Hexcode)
+(UIColor*)colorWithHex:(NSString*)hex {
    if (hex == nil) { return nil; }
    unsigned int c;
    if ([hex characterAtIndex:0] == '#') {
        [[NSScanner scannerWithString:[hex substringFromIndex:1]] scanHexInt:&c];
    } else {
        [[NSScanner scannerWithString:hex] scanHexInt:&c];
    }
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0 green:((c & 0xff00) >> 8)/255.0 blue:(c & 0xff)/255.0 alpha:1.0]; 
}

-(NSString*)hexValue {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSString *hexString = [NSString stringWithFormat:@"#%02x%02x%02x", (int)(red * 255), (int)(green * 255) , (int)(blue * 255)];
    return hexString;
}

-(UIColor*)interpolateWithColor:(UIColor*)color percentage:(float)percentage {
    float red1;
    float green1;
    float blue1;
    float alpha1;
    
    const CGFloat* components = CGColorGetComponents(self.CGColor);
    red1 = components[0];
    green1 = components[1];
    blue1 = components[2];
    alpha1 = CGColorGetAlpha(self.CGColor);
//    [self getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    
    float red2;
    float green2;
    float blue2;
    float alpha2;
    
    const CGFloat* components2 = CGColorGetComponents(color.CGColor);
    red2 = components2[0];
    green2 = components2[1];
    blue2 = components2[2];
    alpha2 = CGColorGetAlpha(color.CGColor);
    
    //[color getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    
    float newRed = red1 + ((red2 - red1) * percentage);
    float newGreen = green1 + ((green2 - green1) * percentage);
    float newBlue = blue1 + ((blue2 - blue1) * percentage);
    float newAlpha = alpha1 + ((alpha2 - alpha1) * percentage);
    
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

@end
