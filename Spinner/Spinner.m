//
//  Spinner.m
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import "Spinner.h"

@implementation Spinner

@synthesize progress = _progress;

- (id)init
{

    UIImage *containerImage = [UIImage imageNamed:@"containerImage"];
    
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, containerImage.size.width, containerImage.size.height)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _containerImageView = [[UIImageView alloc] initWithImage:containerImage];
        [self addSubview:_containerImageView];
        
        _spinnerImage = [UIImage imageNamed:@"spinner"];
        
    }
    
    return self;
}

- (void)setProgress:(float)progress {
    
    _progress = progress;
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef maskContext = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(maskContext, CGRectGetWidth(rect) / 2.0f, CGRectGetHeight(rect) / 2.0f);
    CGContextAddArc(maskContext, CGRectGetWidth(rect) / 2.0f, CGRectGetHeight(rect) / 2.0f, CGRectGetWidth(rect) / 2.0f, (0.0f * M_PI / 180.0f) + (90 * M_PI / 180.0f),  ((360 * ((100 - _progress) / 100.0f)) * M_PI / 180.0f) + (90 * M_PI / 180.0f), 1) ;
    CGContextClosePath(maskContext);
    CGContextSetFillColorWithColor(maskContext, [UIColor blackColor].CGColor);
    CGContextFillPath(maskContext);
    CGContextDrawPath(maskContext, kCGPathFillStroke);
    
    UIImage *mask = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGContextClipToMask(context, rect, mask.CGImage);
    [_spinnerImage drawInRect:rect];
}

@end
