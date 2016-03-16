# share to twitter  /  compose to twitter
##import


Fabric.framework

TwitterKit.framework


##Code

```
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
```