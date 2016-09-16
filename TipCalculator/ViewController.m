//
//  ViewController.m
//  TipCalculator
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billInputField;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.tipPercentLabel.text = [NSString stringWithFormat:@"%d%%", (int)self.tipSlider.value];
    [self tipSliderChanged:self.tipSlider];
    [self.billInputField isFirstResponder];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardGone) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppears:) name:UIKeyboardDidShowNotification object:nil];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string floatValue] || [string isEqualToString:@"0"] || [string isEqualToString:@""] || [string isEqualToString:@"."])
    {
            return YES;
    }
    else
    {
        return NO;
    }

}



- (IBAction)billFieldChanged:(UITextField *)sender {
    NSString *billAmount = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithFloat:[self.billInputField.text floatValue] ] numberStyle:NSNumberFormatterCurrencyStyle];
    NSString *tipAmount = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithFloat:[TipComputer calculateTip:[self.billInputField.text floatValue] tipPercent:(int)self.tipSlider.value] ] numberStyle:NSNumberFormatterCurrencyStyle];
    
    
    
    self.outputLabel.text = [NSString stringWithFormat:@"tip of %d%% on %@ is %@", (int)self.tipSlider.value, billAmount, tipAmount];
}


- (IBAction)tipSliderChanged:(UISlider *)sender {
    self.tipPercentLabel.text = [NSString stringWithFormat:@"%d%%", (int)self.tipSlider.value];
    NSString *billAmount = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithFloat:[self.billInputField.text floatValue] ] numberStyle:NSNumberFormatterCurrencyStyle];
    NSString *tipAmount = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithFloat:[TipComputer calculateTip:[self.billInputField.text floatValue] tipPercent:(int)self.tipSlider.value] ] numberStyle:NSNumberFormatterCurrencyStyle];
    
    
    
    self.outputLabel.text = [NSString stringWithFormat:@"tip of %d%% on %@ is %@", (int)self.tipSlider.value, billAmount, tipAmount];
}

- (void) keyboardGone
{
    //Change stuff back
}

-(void)keyboardAppears:(NSNotification*)notification
{
    //change things to account for kbd
    
    NSLog(@"%@",notification.userInfo);
    //use the info in notification.userInfo to move alter your view (and with all the animation info you can get something to appear exactly with the kbd)
    
}






@end
