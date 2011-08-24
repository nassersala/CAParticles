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
@synthesize slider;
@synthesize pc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization   
    }
    return self;
}


- (IBAction)sliderChanged:(id)sender 
{
   // [particleViewControlle

   [pc parameterViewController:self handleSliderValue:[(UISlider *)sender value]];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


@end
