//
//  Spinner.m
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import "Spinner.h"
#import "ARCMacros.h"

#define DegreesToRadians(degrees) degrees * M_PI / 180
#define RadiansToDegrees(radians) radians * 180/M_PI

@interface Spinner ()

@property (nonatomic,strong) UIImage *spinnerImage;
@property (nonatomic,strong) NSTimer *indefiniteTimer;

-(void)rotate;

@end

@implementation Spinner

@synthesize progress = _progress;
@synthesize spinnerImage = spinnerImage_;
@synthesize indefiniteTimer = indefiniteTimer_;

#pragma mark - Initialization

- (id)init
{
    
    UIImage *containerImage = SV_BUNDLE_IMAGE(@"containerImage");
    
    self = [super initWithFrame:CGRectMake(0.0f, 0.0f, containerImage.size.width, containerImage.size.height)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.spinnerImage = SAFE_ARC_RETAIN(SV_BUNDLE_IMAGE(@"spinner"));
        
        
    }
    
    return self;
}

#pragma mark - Animation Controls

-(void)startAnimating
{
    if(![self isAnimating])
    {
        SAFE_ARC_AUTORELEASE_POOL_START();
        self.indefiniteTimer = SAFE_ARC_RETAIN([NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(rotate) userInfo:nil repeats:YES]);
        SAFE_ARC_AUTORELEASE_POOL_END(); 
    }
}

-(void)stopAnimating
{
    if([self isAnimating])
    {
        [self.indefiniteTimer invalidate];
        SAFE_ARC_RELEASE(self.indefiniteTimer);
    }
}

- (BOOL)isAnimating
{
    return self.indefiniteTimer && [self.indefiniteTimer isValid];
    
}

- (void)setProgress:(float)progress {
    
    _progress = progress;
    [self setNeedsDisplay];
    
}

#pragma mark - Drawing

-(UIImage *)rotateImage:(UIImage *)image byDegrees:(CGFloat)degrees
{
        // Create the bitmap context
        CGSize size = CGSizeMake(image.size.width * image.scale, image.size.height * image.scale);
        UIGraphicsBeginImageContext(size);
        CGContextRef bitmap = UIGraphicsGetCurrentContext();
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, size.width/2, size.height/2);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        CGContextScaleCTM(bitmap, 1.0, -1.0);
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), [image CGImage]);
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
}

-(UIImage *)rotateImage:(UIImage *)image byRadians:(CGFloat)radians
{
    return [self rotateImage:image byDegrees:RadiansToDegrees(radians)];
}

-(void)rotate
{
    _progress += 1.5;
    if(_progress >= 100.0) _progress -=100.0;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGSize size = self.spinnerImage.size;
    rect = CGRectMake(rect.origin.x+4, rect.origin.y+4, size.width, size.height);
    if(!self.indefiniteTimer && [self.indefiniteTimer isValid])
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
   
     
    UIImage *rotatedImage = [self rotateImage:self.spinnerImage byRadians:((_progress/100) *360) *(M_PI/180)];
    
    [rotatedImage drawInRect:rect blendMode:kCGBlendModeNormal alpha:([self isAnimating] ? 1.0 : progress)];
    
}

-(void)dealloc
{
    [self.indefiniteTimer invalidate];
    SAFE_ARC_RELEASE(self.indefiniteTimer);
    SAFE_ARC_RELEASE(self.spinnerImage);
    SAFE_ARC_SUPER_DEALLOC();
}

@end
