//
//  Spinner.h
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Spinner : UIView {

    UIImage *_spinnerImage;
    float _progress;
    BOOL _isIndefiniteMode;
    NSTimer *indefiniteTimer;
}

-(void)startIndefiniteAnimation;
-(void)stopIndefiniteAnimation;

@property (nonatomic, assign) float progress;
@property (nonatomic, assign) BOOL isIndefiniteMode;

@end
