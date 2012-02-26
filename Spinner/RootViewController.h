//
//  RootViewController.h
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootView.h"

@interface RootViewController : UIViewController {
    
    RootView *_rootView;
    
}

- (void)updateSpinner:(NSTimer *)timer;

@end
