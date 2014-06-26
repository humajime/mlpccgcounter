//
//  UIColor+UIColor_Hexcode.h
//  Calorie Count
//
//  Created by Andrew Zimmer on 11/18/11.
//  Copyright (c) 2011 About.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hexcode)
+(UIColor*)colorWithHex:(NSString*)hex;
-(UIColor*)interpolateWithColor:(UIColor*)color percentage:(float)percentage;
-(NSString*)hexValue;

@end
