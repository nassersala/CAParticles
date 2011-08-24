//
//  ViewController.m
//  EmitterTouch
//
//  Created by Nasser Ali on 8/23/11.
//  Copyright (c) 2011 rmh. All rights reserved.
//

#import "ParticlesViewController.h"


@implementation ParticlesViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    //rootLayer = [CALayer layer];
//	[rootLayer setBounds:[[self view] bounds]];
//    [rootLayer setPosition:CGPointMake([[self view] bounds].size.width / 2.0, [[self view] bounds].size.height / 4.0)];
//	[rootLayer setBackgroundColor:[[UIColor blackColor] CGColor]];
    
    UIImage *layerImage = [UIImage imageNamed:@"tspark.png"];
    CGImageRef image = [layerImage CGImage];
    
    emitterContainer = [CAEmitterLayer layer];
	emitterContainer.emitterPosition = CGPointMake([[self view] bounds].size.width / 2, [[self view] bounds].size.width / 2); 
	emitterContainer.renderMode = kCAEmitterLayerAdditive;

    
    particle = [CAEmitterCell emitterCell];
    NSLog(@"the flare is %@", particle);
	particle.contents = (__bridge id)image;
	//flare.emissionLongitude = 4 * M_PI; 
	particle.scale = 0.4;
	particle.velocity = 100;
	particle.birthRate = 450;
	particle.lifetime = 100;
	particle.yAcceleration = -100;
	particle.emissionRange = M_PI * 2 ;
	particle.alphaSpeed = -0.7;
	particle.scaleSpeed = -0.1;
	particle.scaleRange = 0.1;
	particle.beginTime = 0.01;
	particle.duration = 0.7;
    
    [particle setName:@"particle"];
    
    [emitterContainer setEmitterCells:[NSArray arrayWithObjects:particle, nil]];
	//[rootLayer addSublayer:mortor];
    
    [[[self view] layer] addSublayer:emitterContainer];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:[self view]];
    [emitterContainer setEmitterPosition:p];
}
//- (void)update
//{
//    [emitterContainer setValue:
//     [NSNumber numberWithFloat:[delegate velocityValue]] forKeyPath:@"emitterCells.particle.velocity"];
//}
//
- (IBAction)sliderChanged:(id)sender 
{
//    [emitterContainer setValue:
//     [NSNumber numberWithFloat:[(UISlider *)sender value]] 
//                   forKeyPath:@"emitterCells.particle.velocity"];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:[self view]];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [emitterContainer setEmitterPosition:p];
    [CATransaction commit];
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    [barButtonItem setTitle:@"Parameter"];
    [[self navigationItem] setLeftBarButtonItem:barButtonItem];
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [[self navigationItem] setLeftBarButtonItem:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


- (void)parameterViewController:(ParametersViewController *)pvc handleSliderValue:(float)sliderValue
{
    NSLog(@"the slider value is: %f", sliderValue);
    
    [emitterContainer setValue:
     [NSNumber numberWithFloat:sliderValue] 
                    forKeyPath:@"emitterCells.particle.velocity"];
    
    NSLog(@"the value now is %f", [[emitterContainer valueForKeyPath:@"emitterCells.particle.velocity"] floatValue]);
}


@end
