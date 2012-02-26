//
//  RootView.h
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Spinner.h"

@interface RootView : UIView {
    
    Spinner *_spinner;
    
}

@property (nonatomic, readonly) Spinner *spinner;

@end
