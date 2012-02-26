//
//  RootView.m
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import "RootView.h"

@implementation RootView

@synthesize spinner = _spinner;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _spinner = [Spinner new];
        _spinner.frame = CGRectMake(10.0f, 10.0f, CGRectGetWidth(_spinner.frame), CGRectGetHeight(_spinner.frame));
        [self addSubview:_spinner];
        
    }
    return self;
}

@end
