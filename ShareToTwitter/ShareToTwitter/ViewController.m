//
//  ViewController.m
//  ShareToTwitter
//
//  Created by bruce on 16/3/8.
//  Copyright © 2016年 KY. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>
#import <Social/Social.h>

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
//    logInButton.center = CGPointMake(self.view.center.x, self.view.center.y-100);
//    [self.view addSubview:logInButton];
    
    
    
//    shuffle
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

- (IBAction)systemShare:(id)sender {

    NSString *shareText = @"All sad people like poetry,happy people like songs #peotry";
    UIImage *image = [UIImage imageNamed:@"demo_image.jpg"];
    NSURL *urlToShare = [NSURL URLWithString:@"http://gamebegin.com"];
    NSArray *activityItems = @[shareText,image, urlToShare];

    UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                            initWithActivityItems:activityItems
                                            applicationActivities:nil];

    [self presentViewController:activityVC animated:YES completion:nil];

}

- (BOOL)schemeAvailable:(NSString *)scheme {
    NSURL *url = [NSURL URLWithString:scheme];
    if(url){
        return [[UIApplication sharedApplication] canOpenURL:url];
    }else {
        return NO;
    }
}


#pragma mark - share





@end
