//
//  Spinner.m
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import "Spinner.h"
#import "UIImage+RotationExtension.h"
#import "ARCMacros.h"
#import <objc/runtime.h>

#define DegreesToRadians(degrees) degrees * M_PI / 180
#define RadiansToDegrees(radians) radians * 180/M_PI

@interface Spinner ()

-(void)rotate;

@end

@implementation Spinner

@synthesize progress = _progress, isIndefiniteMode=_isIndefiniteMode;

UIImage *rotateImageByDegrees(UIImage *image, CGFloat degrees)
{
        // Create the bitmap context
        UIImage* self = image;
        CGSize size = CGSizeMake(self.size.width *self.scale, self.size.height *self.scale);
        UIGraphicsBeginImageContext(size);
        CGContextRef bitmap = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, size.width/2, size.height/2);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        CGContextScaleCTM(bitmap, 1.0, -1.0);
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), [self CGImage]);
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
}

UIImage *rotateImageByRadians(UIImage *image, CGFloat radians)
{
    return rotateImageByDegrees(image, RadiansToDegrees(radians));
}

- (id)init
{

    UIImage *containerImage = SVBundleImage(@"containerImage");
    
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, containerImage.size.width, containerImage.size.height)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _spinnerImage = SAFE_ARC_RETAIN(SVBundleImage(@"spinner"));
        
        
    }
    
    return self;
}

-(void)rotate
{
    _progress += 1.5;
    if(_progress >= 100.0) _progress -=100.0;
    [self setNeedsDisplay];
}

-(void)startIndefiniteAnimation
{
    if(!_isIndefiniteMode)
    {
    SAFE_ARC_AUTORELEASE_POOL_START();
    indefiniteTimer = SAFE_ARC_RETAIN([NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(rotate) userInfo:nil repeats:YES]);
        _isIndefiniteMode = YES;
    SAFE_ARC_AUTORELEASE_POOL_END(); 
    }
}

-(void)stopIndefiniteAnimation
{
    if(_isIndefiniteMode)
    {
    [indefiniteTimer invalidate];
        SAFE_ARC_RELEASE(indefiniteTimer);
        _isIndefiniteMode = NO;
    }
}

- (void)setProgress:(float)progress {
    
    _progress = progress;
    [self setNeedsDisplay];
    
}



- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGSize size = _spinnerImage.size;
    rect = CGRectMake(rect.origin.x+4, rect.origin.y+4, size.width, size.height);
    if(!_isIndefiniteMode)
    {
    UIGraphicsBeginImageContext(size);
    CGContextRef maskContext = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(maskContext, CGRectGetWidth(rect) / 2.0f, CGRectGetHeight(rect) / 2.0f);
    CGContextAddArc(maskContext, CGRectGetWidth(rect) / 2.0f, CGRectGetHeight(rect) / 2.0f, CGRectGetWidth(rect) / 2.0f, (0.0f * M_PI / 180.0f) + (90 * M_PI / 180.0f),  ((360 * ((100 - _progress) / 100.0f)) * M_PI / 180.0f) + (90 * M_PI / 180.0f), 1) ;
    CGContextClosePath(maskContext);
    CGContextSetFillColorWithColor(maskContext, [UIColor whiteColor].CGColor);
    CGContextFillPath(maskContext);
    CGContextDrawPath(maskContext, kCGPathFillStroke);
    
    UIImage *mask = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGContextClipToMask(context, rect, mask.CGImage);
    }
    float progress = 0.75 + (_progress/400);
   
     
    
    
    [rotateImageByRadians(_spinnerImage, ((_progress/100) *360) *(M_PI/180)) drawInRect:rect blendMode:kCGBlendModeNormal alpha:_isIndefiniteMode ? 1.0 : progress];
}

-(void)dealloc
{
    [indefiniteTimer invalidate];
    SAFE_ARC_RELEASE(indefiniteTimer);
    SAFE_ARC_RELEASE(_spinnerImage);
    SAFE_ARC_SUPER_DEALLOC();
}

@end
