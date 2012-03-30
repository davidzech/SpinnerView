//
//  SpinnerView.m
//  SpinnerView
//
//  Created by Nighthawk on 2/26/12.
//  Copyright (c) 2012 Nighthawk. All rights reserved.
//  Original by Andrew Roy Carter 
//  Check out his other *awesome* projects here: https://github.com/andrewroycarter/


#import "SpinnerView.h"
#import "ARCMacros.h"

@interface SpinnerView ()

@property (nonatomic,strong) Spinner *spinner;
@property (nonatomic,strong) UIImageView *containerImageView;
@property (nonatomic,strong) UIImageView *glowImageView;

@end


@implementation SpinnerView

@synthesize spinner;
@synthesize containerImageView;
@synthesize glowImageView;

#pragma mark - Initialization

-(id)init
{
    return [self initWithFrame:CGRectZero];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
            
        UIImage *containerImage = SV_BUNDLE_IMAGE(@"containerImage");
        UIImage *glowImage = SV_BUNDLE_IMAGE(@"glow");
        
        containerImageView = [[UIImageView alloc] initWithImage:containerImage];
        glowImageView = [[UIImageView alloc] initWithImage:glowImage];
        glowImageView.frame = CGRectMake(0,0, CGRectGetWidth(glowImageView.frame), CGRectGetHeight(glowImageView.frame));
        spinner = [Spinner new];
        spinner.frame = CGRectMake(0.5f, 0.5f, CGRectGetWidth(spinner.frame), CGRectGetHeight(spinner.frame));
        containerImageView.alpha = 0.8;
        CGRect glowRect = glowImageView.frame;
        CGRect containerRect = containerImageView.frame;
        
        containerImageView.frame = CGRectMake(CGRectGetWidth(glowRect)/2-CGRectGetWidth(containerRect)/2, CGRectGetHeight(glowRect)/2-CGRectGetHeight(containerRect)/2, CGRectGetWidth(containerRect), CGRectGetHeight(containerRect));
        
        [containerImageView addSubview:spinner];
        [self addSubview:glowImageView];
        [self insertSubview:containerImageView aboveSubview:glowImageView];
    }
    
    return  self;
}

- (id)initWithFrame:(CGRect)frame
{

    UIImage *containerImage = SV_BUNDLE_IMAGE(@"containerImage");
    UIImage *glowImage = SV_BUNDLE_IMAGE(@"glow");
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, glowImage.size.width, glowImage.size.height)];
    
    if (self) {

        containerImageView = [[UIImageView alloc] initWithImage:containerImage];
        glowImageView = [[UIImageView alloc] initWithImage:glowImage];
        glowImageView.frame = CGRectMake(0,0, CGRectGetWidth(glowImageView.frame), CGRectGetHeight(glowImageView.frame));
        spinner = [Spinner new];
        spinner.frame = CGRectMake(0.5f, 0.5f, CGRectGetWidth(spinner.frame), CGRectGetHeight(spinner.frame));
        containerImageView.alpha = 0.8;
        CGRect glowRect = glowImageView.frame;
        CGRect containerRect = containerImageView.frame;
        
        containerImageView.frame = CGRectMake(CGRectGetWidth(glowRect)/2-CGRectGetWidth(containerRect)/2, CGRectGetHeight(glowRect)/2-CGRectGetHeight(containerRect)/2, CGRectGetWidth(containerRect), CGRectGetHeight(containerRect));
        
        [containerImageView addSubview:spinner];
        [self addSubview:glowImageView];
        [self insertSubview:containerImageView aboveSubview:glowImageView];
        
    }
    return self;
}

#pragma mark - Animation Controls

-(void)startAnimating
{
    [self stopAnimating];
    spinner.progress = 99.9;
    glowImageView.alpha = 1.0;
    [spinner startAnimating];
}

-(void)stopAnimating
{
    [spinner stopAnimating];
    self.progress = 0.0;
    
}

-(BOOL)isAnimating
{
    return [spinner isAnimating];    
}

#pragma mark - Progress Setter+Getter

-(CGFloat)progress
{
    return spinner.progress;
}

-(void)setProgress:(CGFloat)progress
{
    if(![self isAnimating])
    {
        spinner.progress = progress;
        glowImageView.alpha = progress/100.0;
    }
}

#pragma mark - Optional Memory Management

-(void)dealloc
{
    [spinner removeFromSuperview];
    [containerImageView removeFromSuperview];
    SAFE_ARC_RELEASE(spinner);
    SAFE_ARC_RELEASE(containerImageView);
    SAFE_ARC_SUPER_DEALLOC();
}


@end
