//
//  SpinnerView.h
//  SpinnerView
//
//  Created by Nighthawk on 2/26/12.
//  Copyright (c) 2012 Nighthawk. All rights reserved.
//  Original by Andrew Roy Carter 
//  Check out his other *awesome* projects here: https://github.com/andrewroycarter/

#import <Foundation/Foundation.h>
#import "Spinner.h"

@interface SpinnerView : UIView

-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;

@property (nonatomic) CGFloat progress;

@end
