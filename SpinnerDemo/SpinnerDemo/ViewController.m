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
@synthesize timer;

#pragma mark - Initialization

-(void)dealloc
{
    [timer invalidate];
    [timer release];
    [spinnerView release];
    [super dealloc];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSpinnerView:nil];
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

@end
