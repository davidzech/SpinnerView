//
//  Spinner.h
//  Spinner
//
//  Created by Andrew Carter on 2/26/12.
//  Copyright (c) 2012 WillowTree Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Spinner : UIView {
    
    UIImageView *_containerImageView;
    UIImage *_spinnerImage;
    float _progress;
    
}

@property (nonatomic, assign) float progress;

@end
