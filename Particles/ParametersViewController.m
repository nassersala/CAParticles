//
//  ParametersViewController.m
//  EmitterTouch
//
//  Created by Nasser Ali on 8/24/11.
//  Copyright (c) 2011 rmh. All rights reserved.
//

#import "ParametersViewController.h"
#import "ParticlesViewController.h"

@implementation ParametersViewController
@synthesize particleViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization   
    }
    return self;
}


- (IBAction)sliderChanged:(UISlider *)sender 
{

    [particleViewController handleSlider:sender fromParametersViewController:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


@end
