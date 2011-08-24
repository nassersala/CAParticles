//
//  ParametersViewController.h
//  EmitterTouch
//
//  Created by Nasser Ali on 8/24/11.
//  Copyright (c) 2011 rmh. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "ParticlesViewController.h"
@class ParticlesViewController;

@interface ParametersViewController : UIViewController
{
    UISlider *slider;   
}

@property (strong, nonatomic) ParticlesViewController *pc;

@property (strong, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliderChanged:(id)sender;
@end

@protocol ParametersViewControllerDelegate
- (void)parameterViewController:(ParametersViewController *)pvc handleSliderValue:(float)sliderValue;
@end