//
//  ViewController.h
//  SpinnerDemo
//
//  Created by Nighthawk on 2/26/12.
//  Copyright (c) 2012 Nighthawk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpinnerView/SpinnerView.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

-(IBAction)definitePressed:(id)sender;
-(IBAction)indefinitePressed:(id)sender;

@property (retain, nonatomic) IBOutlet SpinnerView *spinnerView;

@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet SpinnerView *scrollViewSpinner;
@property (retain, nonatomic) IBOutlet UILabel *scrollOffset;
@end
