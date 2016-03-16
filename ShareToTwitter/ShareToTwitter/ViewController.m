//
//  ViewController.m
//  ShareToTwitter
//
//  Created by bruce on 16/3/8.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    TWTRLogInButton* logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession* session, NSError* error) {
//        if (session) {
//            NSLog(@"signed in as %@", [session userName]);
//        } else {
//            NSLog(@"error: %@", [error localizedDescription]);
//        }
//    }];
//    logInButton.center = self.view.center;
//    [self.view addSubview:logInButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareToTwitter:(id)sender {
    
//    BOOL twInstalled = [self schemeAvailable:@"twitter://"];
//    if(!twInstalled){
//        NSLog(@"Not installed Twitter");
//        return;
//        
//    }
    
    
    //
    //
    
    
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"demo_image.jpg"];
    [composer setText:@"just setting up my Fabric"];
    [composer setImage: image];
    @try {
        [composer showWithCompletion:^(TWTRComposerResult result) {
            if (result == TWTRComposerResultCancelled) {
                NSLog(@"Tweet composition cancelled");
                
            }else if(result == TWTRComposerResultDone){
                NSLog(@"Tweet composition done");
            }
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
    }
    @finally {
        
    }
    
}

- (BOOL)schemeAvailable:(NSString *)scheme {
    NSURL *url = [NSURL URLWithString:scheme];
    if(url){
        return [[UIApplication sharedApplication] canOpenURL:url];
    }else {
        return NO;
    }
}


@end
