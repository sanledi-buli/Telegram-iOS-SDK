//
//  TALoginPhoneViewController.m
//  Telegram-iOS-SDK
//
//  Created by Hariton Batkov on 3/18/15.
//  Copyright (c) 2015 Hariton Batkov. All rights reserved.
//

#import "TALoginPhoneViewController.h"

#import "TACountriesDelegate.h"
#import "BLCountriesUtils.h"
#import "BLPhoneFormattingManager.h"

#import "ASHandle.h"
#import "TATelegraph.h"

@interface TALoginPhoneViewController () <BLPhoneFormattingDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *countryButton;
@property (weak, nonatomic) IBOutlet UITextField *countryCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;


@property (strong, nonatomic) TACountriesDelegate *countriesDelegate;
@property (strong, nonatomic) BLPhoneFormattingManager *formattingManager;
@property (nonatomic, strong) ASHandle * actionHandle;

@end

@implementation TALoginPhoneViewController

-(void)viewDidLoad {
    self.formattingManager = [BLPhoneFormattingManager phoneFormattingManager:self];
    self.actionHandle = [[ASHandle alloc] initWithDelegate:self releaseOnMainThread:true];
}

- (IBAction)countryTapped:(id)sender {
    
    self.countriesDelegate = [TACountriesDelegate new];
    __weak TALoginPhoneViewController * selff = self;
    self.countriesDelegate.cancelBlock = ^() {
        NSLog(@"Did cancel");
    };
    self.countriesDelegate.selectedBlock = ^BOOL(BLCountry * item) {
        [selff.countryButton setTitle:item.name forState:UIControlStateNormal];
        selff.countryCodeTextField.text = [NSString stringWithFormat:@"+%li", (long)item.code];
        [selff.formattingManager format];
        return YES;
    };
    [self.navigationController pushViewController:[BLContactsViewController contactsControllerWithDelegate:self.countriesDelegate]
                                         animated:YES];
}
- (IBAction)sendCodeButtonTapped:(id)sender {
    if ([self.formattingManager.formattedPhone length])
        [TATelegraph sendCodeToPhone:self.formattingManager.formattedPhone
                             watcher:self];
}

#pragma mark - TAPhoneFormattingDelegate

-(NSString *)phoneNumberForPhoneFormattingManager:(BLPhoneFormattingManager *)formattingManager {
    return [self.phoneTextField text];
}

-(NSString *)countryCodeForPhoneFormattingManager:(BLPhoneFormattingManager *)formattingManager {
    return [self.countryCodeTextField text];
}

-(void)phoneFormattingManager:(BLPhoneFormattingManager *)formattingManager setPhoneNumber:(NSString *)phoneNumber {
    self.phoneTextField.text = phoneNumber;
}

-(void)phoneFormattingManager:(BLPhoneFormattingManager *)formattingManager setCountryCode:(NSString *)code {
    self.countryCodeTextField.text = code;
}

-(void)phoneFormattingManager:(BLPhoneFormattingManager *)formattingManager countryDetected:(BLCountry *)country {
    NSString * title = country ? country.name : self.countryCodeTextField.text.length > 1 ? @"Invalid Country Code" : @"Country Code";
    [self.countryButton setTitle:title
                        forState:UIControlStateNormal];
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
 replacementString:(NSString *)string {
    if (textField == self.phoneTextField)
        return [self.formattingManager phoneNumberTextField:textField
                              shouldChangeCharactersInRange:range
                                          replacementString:string];
    if (textField == self.countryCodeTextField)
        return [self.formattingManager countryCodeTextField:textField
                              shouldChangeCharactersInRange:range
                                          replacementString:string];
    return YES;
}
@end
