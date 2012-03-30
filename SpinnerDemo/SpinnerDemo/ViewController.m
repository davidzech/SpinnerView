//
//  ViewController.m
//  SpinnerDemo
//
//  Created by Nighthawk on 2/26/12.
//  Copyright (c) 2012 Nighthawk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSTimer *timer;

-(void)updateSpinner:(NSTimer*)timer;

@end

@implementation ViewController
@synthesize spinnerView;
@synthesize scrollView;
@synthesize scrollViewSpinner;
@synthesize scrollOffset;
@synthesize timer;

#pragma mark - Initialization

-(void)dealloc
{
    [timer invalidate];
    [timer release];
    [spinnerView release];
    [scrollView release];
    [scrollViewSpinner release];
    [scrollOffset release];
    [super dealloc];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
    
    [[self scrollView] setContentSize:CGSizeMake(320.0, 200)];
}

- (void)viewDidUnload
{
    [self setSpinnerView:nil];
    [self setScrollView:nil];
    [self setScrollViewSpinner:nil];
    [self setScrollViewSpinner:nil];
    [self setScrollOffset:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Timer Action

-(void)updateSpinner:(NSTimer *)timer
{
    CGFloat progress = spinnerView.progress;
    progress += 1.0f;
    spinnerView.progress = progress > 100.0f ? progress-100.0f : progress;
}

#pragma mark - Actions

-(void)definitePressed:(id)sender
{
    [spinnerView stopAnimating];
    [timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
}

-(void)indefinitePressed:(id)sender
{
    [timer invalidate];
    self.timer = nil;
    [spinnerView startAnimating];
}


#pragma mark - UIScrollViewDelegate Adherence

- (void)scrollViewDidScroll:(UIScrollView *)scrollView_ {
    
    CGFloat contentOffset = scrollView_.contentOffset.y;
    
    scrollViewSpinner.progress = fabs(contentOffset);
    [scrollOffset setText:[NSString stringWithFormat:@"%g",contentOffset]];
    
}

@end
