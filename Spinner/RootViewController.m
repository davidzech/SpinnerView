//
//  RootViewController.m
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)loadView {
    
    _rootView = [[RootView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 460.0f)];
    
    self.view = _rootView;
    
}

- (void)viewDidLoad {
    
    [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
    
}

- (void)updateSpinner:(NSTimer *)timer {
    
    float progress = _rootView.spinner.progress;
    
    progress += 1.0f;
    
    if (progress > 100.0f) {
        progress = 0.0f;
    }
    
    _rootView.spinner.progress = progress;
    
}

@end
