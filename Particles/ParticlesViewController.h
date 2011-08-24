//
//  ViewController.h
//  EmitterTouch
//
//  Created by Nasser Ali on 8/23/11.
//  Copyright (c) 2011 rmh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ParametersViewController.h"

@interface ParticlesViewController : UIViewController <UISplitViewControllerDelegate, ParametersViewControllerDelegate>
{
	CAEmitterLayer *emitterContainer;
    
    CAEmitterCell *particle;
}

//- (IBAction)sliderChanged:(id)sender;
@end
