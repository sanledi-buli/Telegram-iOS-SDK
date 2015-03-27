//
//  TAAppDelegate.m
//  Telegram-iOS-SDK
//
//  Created by CocoaPods on 03/17/2015.
//  Copyright (c) 2014 Hariton Batkov. All rights reserved.
//

#import "TAAppDelegate.h"

#import "TATelegraph.h"
#import "MTDatacenterAddress.h"
#import "ActionStage.h"

@implementation TAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [TATelegraph startWithApiId:@"put_your_api_id_here"
                        apiHash:@"put_your_api_hash_here"];
    
    return YES;
}
- (void)actorCompleted:(int)resultCode path:(NSString *)path result:(id)result
{
    if ([path isEqualToString:[NSString stringWithFormat:@"/tg/service/auth/sendCode/(%d)", 0]])
    {
        if (resultCode == ASStatusSuccess)
        {
           /* NSString *phoneCodeHash = [((SGraphObjectNode *)result).object objectForKey:@"phoneCodeHash"];
            
            NSTimeInterval phoneTimeout = (((SGraphObjectNode *)result).object)[@"callTimeout"] == nil ? 60 : [(((SGraphObjectNode *)result).object)[@"callTimeout"] intValue];
            
            bool messageSentToTelegram = [(((SGraphObjectNode *)result).object)[@"messageSentToTelegram"] intValue];
            
            [TGAppDelegateInstance saveLoginStateWithDate:(int)CFAbsoluteTimeGetCurrent() phoneNumber:[[NSString alloc] initWithFormat:@"%@|%@", _countryCodeField.text, _phoneField.text] phoneCode:nil phoneCodeHash:phoneCodeHash codeSentToTelegram:messageSentToTelegram firstName:nil lastName:nil photo:nil];
            
            [self.navigationController pushViewController:[[TGLoginCodeController alloc] initWithShowKeyboard:(_countryCodeField.isFirstResponder || _phoneField.isFirstResponder) phoneNumber:_phoneNumber phoneCodeHash:phoneCodeHash phoneTimeout:phoneTimeout messageSentToTelegram:messageSentToTelegram] animated:true];*/
            
            NSLog(@"Success");
        }
        else
        {
            NSLog(@"Error");
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
