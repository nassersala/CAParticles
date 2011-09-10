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
    

    UIImage *layerImage = [UIImage imageNamed:@"image.png"];
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
    [[[self view] layer] addSublayer:emitterContainer];

}


- (void)handleSlider:(UISlider *)slider fromParametersViewController:(ParametersViewController *)pvc
{
    if ([slider tag] == 1) {
        [emitterContainer setValue:
         [NSNumber numberWithFloat:[slider value]] 
                        forKeyPath:@"emitterCells.particle.velocity"];
    } else if ([slider tag] == 2) {
        [emitterContainer setValue:[NSNumber numberWithFloat:[slider value] * M_PI / 4] 
                        forKeyPath:@"emitterCells.particle.emissionRange"];
    } else if ([slider tag] == 3) {
        [emitterContainer setValue:[NSNumber numberWithFloat: -1 * [slider value]] 
                        forKeyPath:@"emitterCells.particle.yAcceleration"];
    } else if ([slider tag] == 4) {
        [emitterContainer setValue:[NSNumber numberWithFloat:[slider value]] 
                        forKeyPath:@"emitterCells.particle.birthRate"];
    } else if ([slider tag] == 5) {
        [emitterContainer setValue:[NSNumber numberWithFloat:[slider value]] 
                        forKeyPath:@"emitterCells.particle.lifetime"];
    }
    
}


#pragma -
#pragma touches methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:[self view]];
    [emitterContainer setEmitterPosition:p];
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


#pragma -
#pragma splitViewController delegate methods

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



@end
