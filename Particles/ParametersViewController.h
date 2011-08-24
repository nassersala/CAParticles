//
//  ParametersViewController.h
//  EmitterTouch
//
//  Created by Nasser Ali on 8/24/11.
//  Copyright (c) 2011 rmh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ParticlesViewController;

@interface ParametersViewController : UIViewController
@property (strong, nonatomic) ParticlesViewController *particleViewController;


- (IBAction)sliderChanged:(UISlider *)sender;
@end


@protocol ParametersViewControllerDelegate
- (void)handleSlider:(UISlider *)slider fromParametersViewController:(ParametersViewController *)pvc;
@end