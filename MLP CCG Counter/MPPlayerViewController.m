//
//  MPPlayerViewController.m
//  MLP CCG Counter
//
//  Created by Adam on 6/25/14.
//  Copyright (c) 2014 Adam Bellmore. All rights reserved.
//

#import "MPPlayerViewController.h"
#import "MPScore.h"
#import "MPColors.h"
#import <QuartzCore/QuartzCore.h>

@interface MPPlayerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *tokenBackground;
@property (strong, nonatomic) IBOutlet UILabel *tokenCount;
@property (strong, nonatomic) IBOutlet UIButton *turnButton;
@property (strong, nonatomic) IBOutlet UIView *scoreBackground;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionTokenLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextPonyButton;
@property (strong, nonatomic) IBOutlet UIPickerView *scorePicker;
@property (strong, nonatomic) IBOutlet UIButton *addTempATButton;
@property (strong, nonatomic) IBOutlet UIButton *addATButton;
@property (strong, nonatomic) IBOutlet UIButton *removeATButton;

@property (nonatomic) int colorIndex;

- (IBAction)turnPressed:(id)sender;
- (IBAction)addTempTokenPressed:(id)sender;
- (IBAction)addTokenPressed:(id)sender;
- (IBAction)removeTokenPressed:(id)sender;
- (IBAction)nextPonyPressed:(id)sender;

@end

@implementation MPPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.colorIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self updateViews];
    
    self.scoreBackground.layer.cornerRadius = 5;
    self.scoreBackground.layer.masksToBounds = YES;
    self.scoreBackground.layer.borderWidth = 2.0;
    
    self.tokenBackground.layer.cornerRadius = 5;
    self.tokenBackground.layer.masksToBounds = YES;
    self.tokenBackground.layer.borderWidth = 2.0;
    
    self.turnButton.layer.cornerRadius = 5;
    self.turnButton.layer.masksToBounds = YES;
    self.turnButton.layer.borderWidth = 2.0;
    
    self.addATButton.layer.cornerRadius = 5;
    self.addATButton.layer.masksToBounds = YES;
    self.addATButton.layer.borderWidth = 2.0;
    
    self.removeATButton.layer.cornerRadius = 5;
    self.removeATButton.layer.masksToBounds = YES;
    self.removeATButton.layer.borderWidth = 2.0;
}

-(void) viewWillAppear:(BOOL)animated
{
    [self updateViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 16;
}

/*
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
        return [NSString stringWithFormat:@"%d", row];
//        return [NSString stringWithFormat:@"%d | %d", row, [MPScore tokensForScore:row]];
    return @"";
}
 */

-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%d", row];
    label.font = [UIFont fontWithName:@"Verdana-Bold" size:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [MPColors allColors][self.colorIndex][@"text"];
    return label;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.player.score = row;
}

- (IBAction)turnPressed:(id)sender
{
    if(self.player.isActivePlayer)
    {
        [self.player endOfTurn];
        self.player.isActivePlayer = NO;
    }
    else
    {
        [self.player startOfTurn];
        self.player.isActivePlayer = YES;
    }
    [self updateViews];
}

- (IBAction)addTempTokenPressed:(id)sender
{
    [self.player incrementTempTokens:1];
    [self updateViews];
}

- (IBAction)addTokenPressed:(id)sender
{
    [self.player incrementTokens:1];
    [self updateViews];
}

- (IBAction)removeTokenPressed:(id)sender
{
    [self.player decrementTokens:1];
    [self updateViews];
}

- (IBAction)nextPonyPressed:(id)sender
{
    self.colorIndex ++;
    if(self.colorIndex > [[MPColors allColors] count] - 1)
        self.colorIndex = 0;
    
    [self updateViews];
}

-(void) updateViews
{
    NSDictionary *color = [MPColors allColors][self.colorIndex];
    
    self.turnButton.backgroundColor = color[@"button"];
    self.turnButton.layer.borderColor = [((UIColor *)color[@"outline"]) CGColor];
    
    self.addATButton.backgroundColor = color[@"button"];
    self.addATButton.layer.borderColor = [((UIColor *)color[@"outline"]) CGColor];
    
    self.removeATButton.backgroundColor = color[@"button"];
    self.removeATButton.layer.borderColor = [((UIColor *)color[@"outline"]) CGColor];
    
    self.view.backgroundColor = color[@"hair"];

    self.scoreBackground.layer.borderColor = [((UIColor *)color[@"outline"]) CGColor];
    self.scoreBackground.backgroundColor = color[@"body"];
    
    self.tokenBackground.layer.borderColor = [((UIColor *)color[@"outline"]) CGColor];
    self.tokenBackground.backgroundColor = color[@"body"];
    
    self.tokenCount.text = [NSString stringWithFormat:@"%d", self.player.tokens];
    
    self.tokenCount.textColor = color[@"text"];
    self.scoreLabel.textColor = color[@"alt_text"];
    self.actionTokenLabel.textColor = color[@"alt_text"];
    
    if(self.player.hasTempTokens)
        self.tokenCount.textColor = color[@"alt_text"];
    else
        self.tokenCount.textColor = color[@"text"];
    
    if(!self.player.isActivePlayer)
        [self.turnButton setTitle:@"Start Turn" forState:UIControlStateNormal];
    else
        [self.turnButton setTitle:@"End Turn" forState:UIControlStateNormal];
    
    [self.nextPonyButton setTitleColor:color[@"button"] forState:UIControlStateNormal];
    
    [self.scorePicker reloadAllComponents];
    
    if(self.delegate)
        [self.delegate backgroundDidChange:self.view.backgroundColor];
}

@end
