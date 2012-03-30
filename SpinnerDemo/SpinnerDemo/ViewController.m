//
//  ViewController.m
//  SpinnerDemo
//
//  Created by Nighthawk on 2/26/12.
//  Copyright (c) 2012 Nighthawk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)updateSpinner:(NSTimer*)timer;
@end

@implementation ViewController
@synthesize timer;

-(void)updateSpinner:(NSTimer *)timer
{
    CGFloat progress = spinner.progress;
    progress += 1.0f;
    spinner.progress = progress > 100.0f ? progress-100.0f : progress;
}

- (void)viewDidLoad
{
    spinner = [[SpinnerView alloc] initWithFrame:CGRectMake(20, 20, 0, 0)];
    [self.view addSubview:spinner];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)dealloc
{
    [timer invalidate];
    [timer release];
    [spinner release];
    [super dealloc];
}


#pragma mark - ib actions

-(void)definitePressed:(id)sender
{
    [spinner stopAnimating];
    [timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateSpinner:) userInfo:nil repeats:YES];
}

-(void)indefinitePressed:(id)sender
{
    [timer invalidate];
    self.timer = nil;
    [spinner startAnimating];
}

@end
