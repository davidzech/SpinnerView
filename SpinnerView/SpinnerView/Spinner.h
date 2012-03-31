//
//  Spinner.h
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Spinner : UIView

-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;

@property (nonatomic, assign) float progress;

@end
